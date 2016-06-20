class ReferencesController < ApplicationController
  
  # GET /references
  def index
    @references = Reference.all
  end

end
