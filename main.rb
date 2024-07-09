# frozen_string_literal: true

# The StringCalculator class provides a method to sum numbers given in a string format.
# It supports different delimiters, handles new lines between numbers,
# and raises exceptions for negative numbers.
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"
    input = numbers

    if numbers.start_with?('//')
      delimiter = numbers[2]
      input = input[4..]
    end

    number_array = input.split(/#{delimiter}/).map(&:to_i)
    negatives = number_array.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?

    number_array.reduce(:+)
  end
end
