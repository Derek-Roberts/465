class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  
  # GET /images
  def index
    # Check if an image is owned by the current user so the username won't be displayed
    @user_images = owned_by_user if user_signed_in?

    # Gathers images shared with the current user
    @shared_with_user = shared_with_user if user_signed_in?
    
    # Array of the images and array of the usernames for public images
    @public_images = Image.all
    @public_images.each do |image|
      if image.private
        @public_images = @public_images - [image]
      end
    end
    @usernames = @public_images.map { |image| User.find(image.user_id) }
  end

  # GET /images/1
  def show
    # Check if user has access to image
    @has_access = user_has_access @image
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
    @image.filename = generate_filename
    @image.user_id = current_user.id

    @uploaded_io = params[:image][:uploaded_file]
    
    if @uplaoded_io == nil
      flash[:notice] = "Please choose a file to upload."
      render :new
    else

    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end

    end
  end

  # The update is only needed for 
  # PATCH/PUT /images/1
  def update
    if @image.private
      @pub_or_priv = "public"
    else
      @pub_or_priv = "private"
    end

    if @image.update(image_params)
      redirect_to @image, notice: "The image is now #{@pub_or_priv}."
    else
      redirect_to @image, notice: 'Something went wrong while updating privacy settings for the current image.'
    end
   # respond_to do |format|
   #   if @image.update(image_params)
   #     format.html { redirect_to @image, notice: 'Image was successfully updated.' }
   #     format.json { render :show, status: :ok, location: @image }
   #   else
   #     format.html { render :edit }
   #     format.json { render json: @image.errors, status: :unprocessable_entity }
   #   end
   # end
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

    def shared_with_user
      @current_image_user = ImageUser.all.map { |image_user| image_user.image_id if image_user.user_id == current_user.id }.compact
      @images = Image.all.map { |image| image if @current_image_user.include? image.id }.compact
      @usernames = @images.map { |image| User.find(image.user_id).name }
      return @images.zip(@usernames)
    end

    def owned_by_user
      @images = Image.all.map {|image| image if image.user_id == current_user.id}.compact
      return @images
    end

    def user_has_access image
      # If the user isn't signed in, check whether the image is public or not
      if !user_signed_in?
        public_images = Image.all
        public_images.each do |img|
          if img.private
            public_images = public_images - [img]
          end
        end
        public_images.each do |img|
          if img.id == image.id
            return true
          end
        end
      # If the user is signed in, check if the user id matches the image id
      elsif image.user_id == current_user.id
        return true
      # If the user id doesn't match the image id, check if the image is public or it has been shared with the user
      else
        public_images = Image.all
        public_images.each do |img|
          if img.private
            public_images = public_images - [img]
          end
        end
        public_images.each do |img|
          if img.id == image.id
            return true
          end
        end
        shared_images = shared_with_user
        shared_images.each do |img, user_id|
          if img.id == image.id
            return true
          end
        end
      end
      # Retrurn false because the tests have failed
      return false
    end
  # Generates the random filename for the images create function that is 15 characters long and includes lowercase letters and numbers then appends .jpg to the end
  def generate_filename
    charset = Array('a'..'z') + Array(1..9)
    filename = Array.new(15) {charset.sample}.join.concat(".jpg")
    # Check if filename already exists, if it does generate a new one
    image_filenames = Image.all.map { |img| img.filename }
    while image_filenames.include? filename
      filename = Array.new(15) {charset.sample}.join.concat(".jpg")
    end
    return filename
  end
end
