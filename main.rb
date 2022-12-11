require_relative 'knight.rb'
require_relative 'board.rb'

k = Knight.new([1,1])
path = k.move([7,7])

path.reverse.each do |location|
  b = Board.new(Knight.new(location))
  puts "current coordinate = #{location}"
  b.print_board
end
puts "You made it in #{path.length-1} moves!"