class HomeController < ApplicationController

  load "#{Rails.root}/lib/ladder.rb"

  def index
    # Check if the word_id parameter has been given and loads either the 4-letter or 5-letter wordlist.  The 4-letter wordlist will be loaded as default
    if params[:word_id].present? && params[:word_id] == "5"
      @word_length = "5"
      load "#{Rails.root}/lib/words5.rb"
    else
      @word_length = 4
      load "#{Rails.root}/lib/words4.rb"
    end

    # Pick a random word from the dictionary.  If they are the same word then the end_word is re-rolled
    @start_word = dictionary.sample
    @end_word = dictionary.sample
    if @start_word == @end_word
      @end_word = dictionary.sample
    end
  end

  def results
    @all_steps = [params[:start_word], params[:step1], params[:step2], params[:step3], params[:step4], params[:step5], params[:end_word]] 
    # Must get rid of the empty elements if the user didn't use every step
    @all_steps.reject! {|step| step.empty? }
    @steps = [params[:step1], params[:step2], params[:step3], params[:step4], params[:step5]] 
    @steps.reject! {|step| step.empty? }
    @start_word = params[:start_word]
    @end_word = params[:end_word]
    @valid_ladder = legal @all_steps
  end

end
