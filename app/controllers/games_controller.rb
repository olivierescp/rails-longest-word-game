require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10).to_a.join(' ')
  end

  def validate(letters, word)
    params[:letters]
  end

  def score
    query = params[:word]
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{query}").read
    response = JSON.parse(response)
    response[:found]
    response[:length]
    if response["found"] == true
      @score = "Le mot #{query} existe en anglais ! Score : #{response["length"]} points"
    else
      @score = "Le mot #{query} n'existe pas en anglais !"
    end
  end
end
