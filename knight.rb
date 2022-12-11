class Knight
  attr_accessor :symbol, :location, :children, :movement, :parent
  def initialize(location = [1,1], parent = nil)
    # @color
    @symbol = " \u265E "
    @movement = [[1,2], [2,1], [-1,2], [-2,1],
                 [1,-2], [2,-1], [-1,-2], [-2,-1]]
    @location = location
    @children = []
    @parent = parent
  end

  def calc_child(parent)
    result = []
    og_row, og_col = parent.location
    movement.each do |move|
      row, col = move
      x = og_row + row
      y = og_col + col
      result << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    result.each {|pos| self.children << Knight.new(pos, self)}
  end

  def move(target, start = @location)
    queue = []
    current = self
    history = []
    until current.location == target
      history << current.location
      current.calc_child(current)      
      current.children.each do |child|
        queue.push(child)
      end
      queue.reject!{|q| history.include?(q.location)}
      current = queue.shift
    end
    path = []
    until current.parent.nil?
      path << current.location
      current = current.parent
      path << current.location if current.parent.nil?
    end
    path
  end
end