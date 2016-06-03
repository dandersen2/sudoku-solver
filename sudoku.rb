require_relative 'cell'
require 'pry'

class Sudoku

  attr_accessor :board_array

  def initialize(board_input_string)
    @board_array = create_board_array(board_input_string)
  end

  def create_board_array(string)
    board_array = []
    string.split("").each_with_index do |char, index|
      board_array << Cell.new({index: index, value: char, row: row_finder(index), col: col_finder(index), box: box_finder(index), possibilities: ("1".."9").to_a})
    end
    board_array
  end

  def solve
    return false unless valid_board?
    self.board_array.each do |cell_object|
      find_possibilities(cell_object.index)
      if cell_object.possibilities.length == 1
        cell_object.value = cell_object.possibilities[0]
      end
    end
    return self.to_s if solved?
    next_empty_cell = @board_array.find_index { |cell| cell.value == "-" }
    ("1".."9").each do |guess|
      @board_array[next_empty_cell].value = guess
      solved_board = Sudoku.new(self.to_s).solve
      return solved_board.to_s if solved_board
    end
    return false
  end

  def row_finder(board_index)
    row = board_index / 9
  end

  def col_finder(board_index)
    column = board_index - board_index/9*9
  end

  def box_finder(board_index)
    row = row_finder(board_index)
    col = col_finder(board_index)
    if row < 3 && col < 3 then box = 0
    elsif row < 3 && col < 6 then box = 1
    elsif row < 3 && col < 9 then box = 2
    elsif row < 6 && col < 3 then box = 3
    elsif row > 2 && row < 6 && col > 3 && col < 6 then box = 4
    elsif row > 2 && row < 6 && col > 5 then box = 5
    elsif row > 5 && col < 3  then box = 6
    elsif row > 5 && col > 2 && col < 6 then box = 7
    elsif row > 5 && col > 5 then box = 8
    end
    box
  end

  def find_takens(board_index)
    takens = []
    this_row = row_finder(board_index)
    this_col = col_finder(board_index)
    this_box = box_finder(board_index)
    self.board_array.each do |cell_object|
      if cell_object.value != "-"
        if cell_object.row == this_row || cell_object.col == this_col || cell_object.box == this_box
          takens << cell_object.value
        end
      end
    end
    takens.uniq
  end

  def find_possibilities(board_index)
    self.board_array.each_with_index do |cell_object, index|
      if cell_object.value != "-"
        cell_object.possibilities = cell_object.value.split("")
      elsif cell_object.possibilities.length > 1
        cell_object.possibilities = cell_object.possibilities - find_takens(index)
      end
    end
  end

  def solved?
    !board_array.to_s.include?("-")
  end

  def valid_board?
    self.board_array.each_with_index do |cell_object, index|
      unless cell_object.value == "-"
        return false unless (valid_section?(get_row(index)) && valid_section?(get_col(index)) && valid_section?(get_box(index)))
      end
    end
    return true
  end

  def valid_section?(section)
    section.delete("-")
    section.uniq.size == section.size
  end

  def get_row(board_index)
    current_row_values = []
    current_row = self.board_array[board_index].row
    self.board_array.select do |cell_object|
      if cell_object.row == current_row
        current_row_values << cell_object.value
      end
    end
    current_row_values
  end

  def get_col(board_index)
    current_col_values = []
    current_col = self.board_array[board_index].col
    self.board_array.select do |cell_object|
      if cell_object.col == current_col
        current_col_values << cell_object.value
      end
    end
    current_col_values
  end

  def get_box(board_index)
    current_box_values = []
    current_box = self.board_array[board_index].box
    self.board_array.select do |cell_object|
      if cell_object.box == current_box
        current_box_values << cell_object.value
      end
    end
    current_box_values
  end

  def to_s
    board_output_string = []
    self.board_array.each do |cell_object|
      board_output_string << cell_object.value
    end
    board_output_string.join
  end

end


