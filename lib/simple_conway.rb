module SimpleConway
  class << self
    def next_generation(x, y, live_cells)
      return Array.new if out_of_boundary?(x, y, live_cells)

      @grid_x, @grid_y, @live_cells = x, y, live_cells

      @live_cells.reduce(Set.new) do |next_live_cells, live_cell|
        neighbors(live_cell).each {|cell| next_live_cells.add(cell) if alive?(cell)}
        next_live_cells
      end.to_a
    end

    private
    def out_of_boundary?(x, y, live_cells)
      x < live_cells.max_by{|cell| cell.first}.first ||
      y < live_cells.max_by{|cell| cell.last}.last ||
      live_cells.any?{|cell| cell.first < 0 || cell.last < 0}
    end

    def alive?(cell)
      status(cell) == :on || (status(cell) == :same && @live_cells.include?(cell))
    end

    def status(cell)
      case neighbors(cell).count {|near_cell| Set.new(@live_cells).include?(near_cell)}
        when 0..1 then :off
        when 2 then :same
        when 3 then :on
        else :off
      end
    end

    def neighbors(cell)
      cell_x, cell_y = cell.first, cell.last

      Array(cell_x-1..cell_x+1).product(Array(cell_y-1..cell_y+1)).delete_if do |near_x, near_y|
        (near_x == cell_x && near_y == cell_y) || (cell_x <= 0 || cell_x > @grid_x) || (cell_y <= 0 || cell_y > @grid_y)
      end
    end
  end
end
