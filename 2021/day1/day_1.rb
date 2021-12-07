# frozen_string_literal: true

def read_input
  file = File.open('input.txt')
  input = file.readlines.map(&:chomp).map(&:to_i)
  file.close
  input
end

def task1(depths)
  increases = 0
  depths.each_with_index do |depth, i|
    next if i.zero?

    increases += 1 if depth > depths[i - 1]
  end
  puts "1st task: #{increases} increases."
end

def task2(depths)
  increases = 0
  depths.each_with_index do |depth, i|

    break if i >= depths.length - 3

    first_trio = depths[i] + depths[i + 1] + depths[i + 2]
    second_trio = depths[i + 1] + depths[i + 2] + depths[i + 3]

    increases += 1 if first_trio < second_trio
  end
  puts "2nd task: #{increases} increases."
end

task1(read_input)
task2(read_input)

