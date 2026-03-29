# frozen_string_literal: true

module ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(duo)
    color_a, color_b = duo
    tens = COLORS.index(color_a) * 10
    ones = COLORS.index(color_b)

    tens + ones
  end
end
