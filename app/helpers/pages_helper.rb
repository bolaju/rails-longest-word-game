module PagesHelper
  def score(data)
    time_taken = data[:time_end] - data[:time_start]
    data[:word].length / time_taken
  end

  def check_word(data)
    invalid_letters = data[:word].split('').reject do |letter|
      data[:letters].split('').include? letter
    end
    return 'Invalid letters used!' unless invalid_letters.length.zero?
  end
end
