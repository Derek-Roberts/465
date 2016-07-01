class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # Generates the random filename for the images create function that is 15 characters long and includes lowercase letters and numbers then appends .jpg to the end
  def generate_filename
    charset = Array('a'..'z') + Array(1..9)
    @image.filename = Array.new(15) {charset.sample}.join.concat(".jpg")
    # Check for uniqueness
  end

  # GET /images
  def index
    # Must check whether the user can see these private images or not
    @shared_with_me = shared_with_me
    # Creates the public_images array
    @public_images = Image.all
    @public_images.each do |image|
      if image.private
        @public_images = @public_images - [image]
      end
    end

    @shared_with_user = Array.new

    # Array of the usernames for the public images
    @usernames = @public_images.map { |image| User.find(image.user_id) }

    # Check if an image is owned by the current user so the username won't be displayed
    if user_signed_in?
      @user_private_images = private_owned_by_user
    end
  end

  # GET /images/1
  def show
    # create new tag for image's show page
    @tag = @image.tags.new
    # create new image_user to fill in on the image's show page
    @image_user = @image.image_users.new
    @image_user.user_id = @image.user_id
    @owned_by_current_user = (@image_user.user.name == current_user)
    #@eligible_users
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @image = Image.new(image_params)
    @image.generate_filename  # a function you write to generate a random filename and put it in the images "filename" variable
    @image.user = current_user

    @uploaded_io = params[:image][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  def destroy
    # Must delete the image file itself
    File.delete(Rails.root.join('public', 'images', @image.filename))

    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:filename, :private, :user_id)
    end

    def users_without_access
      user_array = User.all - self.users - [self.user]

      #user_array.delete(self.user)

      # ADD MORE HERE
    end

    def shared_with_me

    end

    def private_owned_by_user
      @images = Image.all.map {|image| image if image.user_id == current_user.id && image.private == true }.compact
      return @images
    end
end
