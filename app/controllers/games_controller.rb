require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    @spellcheck = JSON.parse(response.read)
    @word = params[:word]
    @letters = params[:letters]
    if @word.all?(@letters)
      if @spellcheck
        @result = "it is a valid English word"
      else
        @result = "word is not a valid Engish word"
      end
    else
     @result = "word cannot be built"
    end
  end
end
