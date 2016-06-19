# Maze solver

##Overview
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

##Running
Put the solver.rb and maze.txt in same dirctory and run the solver.

```sh
ruby solver.rb maze.txt
```

It will output a maze-solution.txt file to the same directory. 


##Speed 

It should be noted that currently this runs in O(n^2)

| File               | Size    | Time       |
| ------------------ |:-------:| ----------:|
| maze1.txt          | 16x8    |   0.002589 |
| mazeLong.txt       | 16x49   |   0.034111 |
| maze-2193lines.txt | 16x2193 | 139.366923 |