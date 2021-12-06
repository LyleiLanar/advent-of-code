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

# !!! These two function can be refactored to reduce duplication.
def most_common_bit_by_position(array, position)
  result = 0
  array.each { |num| num[position] == '1' ? result += 1 : result -= 1 }
  result >= 0 ? '1' : '0'
end

def least_common_bit_by_position(array, position)
  result = 0
  array.each { |num| num[position] == '1' ? result += 1 : result -= 1 }
  result < 0 ? '1' : '0'
end
# !!!

def get_rows_by_value_at_bit_index(array, bit_index, value)
  new = []
  array.each { |elem| new << elem if elem[bit_index] == value }
  new
end

# !!! These two function can be refactored to reduce duplication.
def oxygen_gen_rating(array, index)
  return array[0] if array.length == 1

  most_common_bit = most_common_bit_by_position(array, index)
  new_array = get_rows_by_value_at_bit_index(array, index, most_common_bit)
  oxygen_gen_rating(new_array, index + 1)
end

def co2_scrub_rating(array, index)
  return array[0] if array.length == 1

  most_common_bit = least_common_bit_by_position(array, index)
  new_array = get_rows_by_value_at_bit_index(array, index, most_common_bit)
  co2_scrub_rating(new_array, index + 1)
end
# !!!

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

def task2
  input = read_input
  oxygen_gen_rating(input, 0).to_i(2) * co2_scrub_rating(input, 0).to_i(2)
end

puts "Task2: #{task2}"
puts "Task1: #{task1(read_input)}"


