# frozen_string_literal: true

# Calculator to add numbers from a string.
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers = numbers.split(get_delimiter(numbers), -1)

    validate_input(numbers)

    numbers.map(&:to_i).reduce(:+)
  end

  def get_delimiter(numbers)
    delimiter = /[\n,]/
    delimiter = numbers[2..numbers.index("\n") - 1] if numbers.start_with?('//')

    delimiter
  end

  def validate_input(numbers)
    raise 'Invalid input' if numbers.include?('')

    negatives = numbers.select { |n| n.to_i.negative? }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
  end
end
