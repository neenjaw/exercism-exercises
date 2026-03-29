# frozen_string_literal: true

require 'forwardable'

# class for managing arcade high-scores
class HighScores
  attr_reader :scores

  extend Forwardable

  def_delegator :scores, :last, :latest
  def_delegator :scores, :max, :personal_best

  def initialize(scores)
    @scores = scores
  end

  def personal_top_three
    personal_best(3)
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end
