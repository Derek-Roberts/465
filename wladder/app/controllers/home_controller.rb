class HomeController < ApplicationController

  load "#{Rails.root}/lib/ladder.rb"

  def index
    # Pick a random word from the dictionary
    @start_word = dictionary.first
    @end_word = dictionary.last
  end

  def results
    #legal steps
    #@query_text = params[:query]
    #if @query_text =~ /^[a-zA-Z0-9\.\-]*$/
    #  @result = `whois #{@query_text}`.split("\n")
    #else
    #  @result = ["Illegal URL"];
    #end
    @steps = [params[:step1], params[:step2], params[:step3], params[:step4], params[:step5]] 
  end

end
