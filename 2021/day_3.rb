# frozen_string_literal: true

def read_input
  file = File.open('inputs/day3.txt')
  input = file.readlines.map(&:chomp)
  file.close
  input
end

def test_input
  %w[00100 11110 10110 10111 10101 01111 00111 11100 10000 11001 00010 01010]
end

def get_bits(array)
  bits = []
  array.each { |elem| bits << elem.split('') }
  bits
end

def most_common_bit_by_position(array, position)
  result = 0
  array.each { |num| num[position] == '1' ? result += 1 : result -= 1 }
  result.positive? ? '1' : '0'
end

def least_common_bit_by_position(array, position)
  result = 0
  array.each { |num| num[position] == '1' ? result += 1 : result -= 1 }
  result.positive? ? '0' : '1'
end

def task1(input)
  gamma = ''
  epsilon = ''
  array = get_bits(input)
  array[0].length.times do |position|
    gamma << most_common_bit_by_position(array, position)
    epsilon << least_common_bit_by_position(array, position)
  end
  gamma.to_i(2) * epsilon.to_i(2)
end

puts "Task1: #{task1(read_input)}"


