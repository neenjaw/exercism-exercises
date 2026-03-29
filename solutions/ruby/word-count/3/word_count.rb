class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase
      .downcase
      .scan(/\b[[:alnum:]']+\b/)
      .tally
  end
end
