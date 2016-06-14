class HomeController < ApplicationController

  def index
      # don't need to do anything here
  end

  def results
    #@query_text = params[:query]
    #if @query_text =~ /^[a-zA-Z0-9\.\-]*$/
    #  @result = `whois #{@query_text}`.split("\n")
    #else
    #  @result = ["Illegal URL"];
    #end
    @input = [params[:step1], params[:step2], params[:step3], params[:step4], params[:step5]] 
  end

end
