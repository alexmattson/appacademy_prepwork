# Maze solver

This is a complete asterisks maze solver Built on a simple 
[Sample Algorithm][maze1] search path. 

[maze1]: https://en.wikipedia.org/wiki/Pathfinding

It takes a text file as an input that has a maze layed out in the following 
fashion:

'''****************
*         *   E*
*    *    *  ***
*    *    *    *
*    *    *    *
*    *    *    *
*S   *         *
****************'''

Make your program run as a command line script, taking in the name of
a maze file on the command line.

[maze1-solution]: mazes/maze1-solution.txt

Your path through the maze should not be self-intersecting, of course.

When you have found a first solution, write a version which will be
sure to find the *shortest path* through the maze.


## Resources
**NB**: Try taking a naive approach first. Once you've got something
working read on...

* Reading Files [progzoo]
* Simple-ish explanation for computer pathfinding, start at "Starting
  the Search" heading [policyalmanac]
* Wikipedia: maze shortest path [wikipedia]

[pathfinding]: http://theory.stanford.edu/~amitp/GameProgramming/AStarComparison.html
[progzoo]: http://progzoo.net/wiki/Ruby:Read_a_Text_File
[policyalmanac]: http://www.policyalmanac.org/games/aStarTutorial.htm
[wikipedia]: http://en.wikipedia.org/wiki/Maze_solving_algorithm#Shortest_path_algorithm
