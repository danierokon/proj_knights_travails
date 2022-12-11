require_relative 'color.rb'

class Board
  attr_reader :grid
  attr_accessor :knight

  # 8x8 grid
  def initialize(knight)
    @grid = [
            ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
            ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
            ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
            ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
            ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
            ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
            ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
            ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
            ]
    @knight = knight
  end

  def update_board(kni_loc = @knight.location)
    row, col = kni_loc
    grid[col][row] = knight.symbol
  end

  # [0,0] to [7,7]
  # y even x even = black
  # y even x odd = white
  # y odd x even = white
  # y odd x odd = black
  def print_board
    update_board
    grid.reverse.each_with_index do |row, c_index|
      row.each_with_index do |_tile, r_index|
        print row[r_index].black.bg_gray if (r_index.even? && c_index.even?) || (r_index.odd? && c_index.odd?)
        print row[r_index].black.bg_brown if (r_index.odd? && c_index.even?) || (r_index.even? && c_index.odd?)
        print "\n" if r_index == 7
      end
    end
  end
end