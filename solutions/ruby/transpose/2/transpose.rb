# frozen_string_literal: true

module Transpose
  class << self
    ##
    # transpose
    # receives text as a string as input.  Converts the string to a matrix of characters,
    # performs a transpose, then re-joins the transposed string for the result
    def transpose(text)
      text
        .split("\n")
        .map { |line| line.split('') }
        .then { |matrix| do_transpose(matrix) }
        .map(&:join)
        .join("\n")
    end

    private

    ##
    # do_transpose
    # Perform a matrix transpose. Once transposed, fill in all `nil` values with spaces.
    def do_transpose(character_matrix)
      replace_nil_with_space = ->(char) { char || ' ' }

      character_matrix
        .each_with_index
        .each_with_object([]) { |row_pair, arr| transpose_row_to_column(row_pair, arr) }
        .map { |row| row.map(&replace_nil_with_space) }
    end

    ##
    # transpose_row_to_column
    # for each character at (x, y), place it at (y, x)
    def transpose_row_to_column(row_pair, arr)
      row, row_index = row_pair

      row.each_with_index.each_with_object(arr) do |column_pair, arr|
        char, column_index = column_pair

        arr[column_index] ||= []
        arr[column_index][row_index] = char
      end
    end
  end
end
