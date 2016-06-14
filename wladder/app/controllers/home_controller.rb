class HomeController < ApplicationController

  load "#{Rails.root}/lib/ladder.rb"

  def index
    # Pick a random word from the dictionary.  If they are the same word then the end_word is re-rolled
    @start_word = dictionary.sample
    @end_word = dictionary.sample
    if @start_word == @end_word
      @end_word = dictionary.sample
    end
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
    @start_word = params[:start_word]
    @end_word = params[:end_word]
  end

end
