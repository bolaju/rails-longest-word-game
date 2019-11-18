require 'json'
require 'open-uri'
require 'time'

class PagesController < ApplicationController
  include PagesHelper
  DATA = { time_start: nil, time_end: nil, word: nil,
           user_score: nil, exist_message: nil, invalid_message: nil, letters: nil }
  def game
    DATA[:time_start] = Time.now
    @letters = ('A'..'Z').to_a.sample(10).join('')
    DATA[:letters] = @letters
  end

  def result
    DATA[:word] = params['word'].upcase
    DATA[:time_end] = Time.now
    url = "https://wagon-dictionary.herokuapp.com/#{params['word']}"
    raw_json = open(url).read
    word_hash = JSON.parse(raw_json)
    DATA[:exist_message] = @exist_message = "Word doesn't exist!" unless word_hash['found']
    DATA[:user_score] = @score = score(DATA)
    DATA[:invalid_message] = @invalid_message = check_word(DATA)
  end
end
