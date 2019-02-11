require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = params[:letters] # name can be different
    @letters = ('a'..'z').to_a.shuffle[0,10]
  end

  def score
    @response = params[:word]
     url = "https://wagon-dictionary.herokuapp.com/#{@response}"
     word_serialized = open(url).read
     @word = JSON.parse(word_serialized)
      if @word["found"]
      @score = "Cool"
    else @score = "word does not exist"
    end
  end
end



