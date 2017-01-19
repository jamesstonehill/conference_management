require_relative './requires.rb'

talks = []

File.open('test_input.txt').each do |line|

  # remove newline character from end of line
  line = line.strip

  p line
  talks << Talk.new(line)
end

manager = ConferenceManager.new(talks)

p manager
