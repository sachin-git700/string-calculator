class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"
    input = numbers

    if numbers.start_with?('//')
      delimiter = numbers[2]
      input = input[4..-1]
    end

    number_array = input.split(/#{delimiter}/).map(&:to_i)
    negatives = number_array.select { |num| num < 0 }
    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?

    number_array.reduce(:+)
  end
end
