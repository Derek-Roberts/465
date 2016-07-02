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
        redirect_to :back
    else
        format.html { redirect_to image_path(@image_user), notice: 'Image was unsuccessfully shared' }
    end
  end

  # PATCH/PUT /image_users/1
  # PATCH/PUT /image_users/1.json
  def update
    respond_to do |format|
      if @image_user.update(image_user_params)
        format.html { redirect_to @image_user, notice: 'Image user was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_user }
      else
        format.html { render :edit }
        format.json { render json: @image_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_users/1
  # DELETE /image_users/1.json
  def destroy
    @image_user.destroy
    respond_to do |format|
      format.html { redirect_to image_users_url, notice: 'Image user was successfully destroyed.' }
      format.json { head :no_content }
    end
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
