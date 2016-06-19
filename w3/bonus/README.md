# Maze solver

This is a complete asterisks maze solver Built on a simple 
[Sample Algorithm][maze1] search path. 

[maze1]: https://en.wikipedia.org/wiki/Pathfinding

It takes a text file as an input that has a maze layed out in the following 
fashion:

```sh
****************
*         *   E*
*    *    *  ***
*    *    *    *
*    *    *    *
*    *    *    *
*S   *         *
****************
```

Put the solver.rb and maze.txt in same dirctory and run the solver.

```sh
ruby solver.rb maze.txt
```

It will output a maze-solution.txt file to the same directory. 