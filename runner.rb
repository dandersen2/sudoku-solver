require_relative 'sudoku'

difficulty_level = ARGV[0].to_i - 1
board_string = File.readlines('sudoku_puzzles.txt')[difficulty_level].chomp

game = Sudoku.new(board_string)
p game.solve
