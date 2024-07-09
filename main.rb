class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"
    input = numbers

    if numbers.start_with?('//')
      delimiter = numbers[2]
      input = input[4..-1]
    end

    input.split(/#{delimiter}/).map(&:to_i).reduce(:+)
  end
end
