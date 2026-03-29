class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase
      .downcase
      .split(/[^'[:alnum:]]+/)
      .delete_if(&:empty?)
      .map { |word| trim_quotes(word) }
      .tally
  end

  private

  def trim_quotes(word)
    quote = %(')
    word.delete_prefix(quote).delete_suffix(quote)
  end
end
