# Please implement your solution to anagram in this file
class Anagram
  def self.find(subject, candidates)
    sorted_subject = sort_letters(subject)
    downcased_subject = subject.downcase

    candidates.select do |candidate|
      sorted = sort_letters(candidate)
      downed = candidate.downcase
      match = sorted == sorted_subject
      same = downcased_subject == downed

      if match && !same
        candidate
      end
    end
  end

  private def self.sort_letters(word)
    word.downcase.chars.sort.join
  end
end
