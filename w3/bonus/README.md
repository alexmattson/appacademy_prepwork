# Maze solver

##Overview
This is a complete asterisk maze solver Built on a simple 
[Sample Algorithm][maze1] search path solution. 

[maze1]: https://en.wikipedia.org/wiki/Pathfinding

The Solver takes a text file as an input that has a maze layed out in the 
following fashion:

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

##Running
Put the solver.rb and maze.txt in same dirctory. Run the solver, calling the
the maze like so:

```sh
ruby solver.rb maze.txt
```

Output will be a maze-solution.txt file to the same directory. 


##Speed 

It should be noted that currently this runs in O(n^2) time with the following
benchmarks:

| File               | Size    | Time       |
| ------------------ |:-------:| ----------:|
| maze1.txt          | 16x8    |   0.002589 |
| mazeLong.txt       | 16x49   |   0.034111 |
| maze-2193lines.txt | 16x2193 | 139.366923 |