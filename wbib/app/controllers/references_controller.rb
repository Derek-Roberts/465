class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]

  # GET /references
  def index
    @references = Reference.all
  end

  # GET /references/new
  def new
    @reference = Reference.new
  end
  
  # POST /references
  def create
    @reference = Reference.new(reference_params)
    if @reference.save
      redirect_to @reference, notice: 'Reference was successfully created.'
    else
      render :new
    end
  end

  # GET /references/1/edit
  def edit
  
  end

  # PATCH /references/1
  def update
    if @reference.update(reference_params)
      redirect_to @reference, notice: 'Reference was successfully updated.'  
    else
      render :edit
    end
  end

  # DELETE /references/1
  def destroy
    @reference.destroy
      redirect_to references_url, notice: 'Reference was successfully destroyed.'
  end

  # GET /references/1
  def show

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reference
    @reference = Reference.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through
  def reference_params
    params.require(:reference).permit(:url, :topic, :annotation, :creationtime)
  end

end
