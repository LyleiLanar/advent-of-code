# frozen_string_literal: true

def read_input
  file = File.open('input.txt')
  input = file.readlines.map(&:chomp).map(&:split).map { |command| [command[0], command[1].to_i] }
  file.close
  input
end

def task1(array)
  depth = 0
  horizontal = 0

  array.each do |row|
    command = row[0]
    dist = row[1]

    case command
    when 'forward'
      horizontal += dist
    when 'down'
      depth += dist
    when 'up'
      depth -= dist
    else
      raise ArgumentError, 'You messed up!'
    end
  end
  depth * horizontal
end

def task2(array)
  depth = 0
  horizontal = 0
  aim = 0

  array.each do |row|
    command = row[0]
    dist = row[1]

    case command
    when 'forward'
      horizontal += dist
      depth += dist * aim
    when 'down'
      aim += dist
    when 'up'
      aim -= dist
    else
      raise ArgumentError, 'You messed up!'
    end
  end
  depth * horizontal
end

puts "Task1: #{task1(read_input)}."
puts "Task2: #{task2(read_input)}."

