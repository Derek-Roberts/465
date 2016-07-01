class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  #def show
    #@image = Image.all.map { |img| img if img.id == @tag.image_id}
    #redirect_to @image
  #end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @image = Image.find params[:image_id]
    @tag = @image.tags.new(tag_params)

    if @tag.save
      redirect_to image_url(@tag.image_id), notice: 'Tag was successfully created.'
    else
      redirect_to image_url(@tag.image_id), notice: 'The tag was empty and thus not created.'
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      redirect_to image_url(@tag.image_id), notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
      #format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      redirect_to(:back)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:str, :image_id)
    end
end
