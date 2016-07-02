class ImageUsersController < ApplicationController
  before_action :set_image_user, only: [:show, :edit, :update, :destroy]

  # GET /image_users
  # GET /image_users.json
  def index
    @image_users = ImageUser.all
  end

  # GET /image_users/1
  # GET /image_users/1.json
  def show
  end

  # GET /image_users/new
  def new
    @image_user = ImageUser.new(image_user_params)
    #@id = params[:id]
    #puts "ID is: " + @id
    @image_user = ImageUser.create
    #@image_user = @image.image_users.new
  end

  # GET /image_users/1/edit
  def edit
  end

  # POST /image_users
  # POST /image_users.json
  def create
    #@image_user = @image.image_users.new(image_user_params)
    @image_user = ImageUser.new(image_user_params)
    @image_user.image_id = params[:image_id]
    #@image_user.user_id = params[:user_id]
    if @image_user.save
        #format.html { redirect_to image_path(@image_user), notice: 'Image was successfully shared' }
        flash[:notice] = "Image successfully shared"
        redirect_to :back
    else
        flash[:notice] = "Image unsuccessfully shared.  Something went wrong"
        redirect_to :back
    end
  end

  # PATCH/PUT /image_users/1
  # PATCH/PUT /image_users/1.json
  def update
    respond_to do |format|
      if @image_user.update(image_user_params)
        flash[:notice] = "Image has been successfully updated"
        redirect_to :back
      else
        flash[:notice] = "Image was unable to be updated.  Something went wrong"
        redirect_to :back
      end
    end
  end

  # DELETE /image_users/1
  # DELETE /image_users/1.json
  def destroy
    @image_user.destroy
    #respond_to do |format|
    #    flash[:notice] = "Image has been successfully unshared"
    #    redirect_to :back
    #end
        flash[:notice] = "Image has been successfully unshared"
        redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_user
      @image_user = ImageUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_user_params
      params.require(:image_user).permit(:id, :user_id)
    end
end
