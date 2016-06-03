# sudoku-solver
Recursive, Object-oriented sudoku puzzle solver

This is a sudoku solving algorithm using classes to represent the elements of a sudoku puzzle. Each cell on the board is treated as an instance of the "cell" class. The "solve" method within sudoku.rb uses several helper methods to analyze the board and create the models for each of the 81 cells in the puzzle. The helper methods use standard sudoku strategies to deduce the possibilities for any blank spaces and fill in any cells that can be solved with certainty. Once these methods have been exhausted and can not find any new solvable cells, the solve method begins to guess numbers for the remaining cells. The solve method will run recursively until it has placed a number in every cell on the board while not violating any of the standard sudoku rules that would make the solution invalid.

Puzzles are entered as strings as the argument for a new instance of the Sudoku class. 16 boards are listed in sudoku_puzzles.txt. This sudoku solver can successfully solve all 16. These boards are of steadily increasing difficulty from lines 1-14, 14 being the hardest because it has the most blank spaces(represented by a dash). Line 15 is an empty board. Line 16 is the [World's Hardest Sudoku Puzzle](http://www.telegraph.co.uk/news/science/science-news/9359579/Worlds-hardest-sudoku-can-you-crack-it.html). The puzzle as well as it's solution can be seen here:

[Hardest Sudoku Unsolved:](https://github.com/dandersen2/sudoku-solver/blob/master/worlds-hardest-sudoku.jpg)

[Hardest Sudoku Solved(spoiler alert!):](https://github.com/dandersen2/sudoku-solver/blob/master/worlds-hardest-sudoku-solution.jpg)

This Solver solves puzzle #16 in 1 minute 15 seconds on my computer. Some improvements that could cut down on this time would be to implement more helper methods to deduce even more of the board in the initial solving process before the program begins to guess. Every cell that can be filled deductively will reduce the solve time since most of this time is spent guessing and back-tracing when an incorrect guess is made.

This [project](https://github.com/nyc-chorus-frogs-2016/sudoku-challenge) was initially attempted as a group effort for phase-1 of [Dev Bootcamp](http://devbootcamp.com/) but I did not manage to solve all 16 of the puzzles until later after continuing tobuild on the methods my group had created and adding the recursive solve method. I later realized that the simplest solution is probably to represent the boards and cells as strings and manipulate them as strings, however we had already built out all of out initial methods using classes so I continued in this direction.

###Try it out!:
#####Can't solve that puzzle? Use the solver and get some help.

To try the solver, download or clone this repo to your computer and inside the sudoku-solver folder type "ruby runner.rb 11" into the command line and hit enter to solve puzzle 11. Type any number 1-16 after "ruby runner.rb" to solve the puzzle on that line of sudoku_puzzles.txt. To add another puzzle, type out all 81 digits of the unsolved puzzle onto line 17(after the last line of numbers) of sudoku_puzzles.txt without spaces, using "-" for empty cells. To solve your puzzle, save the puzzles file and type "ruby runner.rb 17" into the command line and hit enter. Depending on the difficulty of the puzzle and the speed of your computer the solver should print out the solved puzzle as a string as soon as it's done in about 0-2 minutes.
