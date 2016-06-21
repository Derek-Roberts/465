class ReferencesController < ApplicationController
  
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
    @reference = Reference.new(params.require(:reference).permit(:url, :topic, :annotation, :creationtime))
    if @reference.save
      redirect_to @reference, notice: 'Reference was successfully created.'
    else
      render :new
    end
  end

  # GET /references/1
  def show
    @reference = Reference.find(params[:id])
  end

end
