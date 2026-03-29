##
# This class represents a word for other words to be tested if they are anagrams
class Anagram
  attr_reader :normalized_source_word
  attr_reader :source_letters

  def initialize(word)
    @normalized_source_word = normalize_word(word)
    @source_letters = sort_letters(word)
  end

  ##
  # match
  # filters the list of string words, the returned array of words are all
  # anagrams of the source word
  def match(words_to_test)
    words_to_test
      .filter do |word|
        normalize_word(word) != normalized_source_word &&
          sort_letters(word) == source_letters
      end
  end

  private

  def normalize_word(word)
    word.dup.downcase.freeze
  end

  def sort_letters(word)
    word.downcase.chars.sort.join.freeze
  end
end
