class Board

  def initialize(numbers)
    @numbers = numbers
  end

  attr_reader :numbers

  # If find a number with the @mark integer value in the numbers array, change the value to nil.
  # It means that number is marked.
  def mark_number(mark)
    @numbers.each do |values|
      values.map! do |value|
        if value == mark
          nil
        else
          value
        end
      end
    end
  end

  # If a row or a column is marked return true.
  def fulfilled?
    row_fulfilled? || column_fulfilled?
  end

  # Returns the sum of the not marked values.
  def sum
    @numbers.flatten.compact.reduce(0) { |pre, cur| pre + cur }
  end

  private

  # If a row is marked return true.
  def row_fulfilled?
    @numbers.any? { |row| row.compact.empty? }
  end

  # If a column is marked return true.
  def column_fulfilled?
    @numbers.transpose.any? { |row| row.compact.empty? }
  end
end

