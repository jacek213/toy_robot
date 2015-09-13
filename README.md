# Toy Robot Simulation
[![Build Status](https://travis-ci.org/jacekgrzybowski/toy_robot.svg?branch=master)](https://travis-ci.org/jacekgrzybowski/toy_robot) 

Simulation of a toy robot  which moves around the table in any direction and is prevented from falling.

## Description

* Robot moves on a square tabletop, of dimensions 5 units x 5 units
* There are no other obstructions on the table surface
* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction
* Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed

### Commands

* `PLACE <X>,<Y>,<DIRECTION>` - put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.

* `MOVE` - move the toy robot one unit forward in the direction it is currently facing.
  
* `LEFT|RIGHT` - rotate the robot 90 degrees in the specified direction without changing the position of the robot.

* `REPORT` - announce the `<X>,<Y>,<DIRECTION>` of the robot.

### Constraints

* The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command
* The application should discard all commands in the sequence until a valid `PLACE` command has been executed.
* A robot that is not on the table can choose the ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.
* The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. Any move that would cause the robot to fall must be ignored.

### Example input and output

    PLACE 0,0,NORTH
    MOVE
    REPORT
  Output => `0,1,NORTH`
    
    PLACE 0,0,NORTH
    LEFT
    REPORT
  Output => `0,0,WEST`

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT
  Output => `3,3,NORTH`  
    
## Installation

1. Clone the repo: `$ git clone git@github.com:jacekgrzybowski/toy_robot.git`
2. Install dependencies: `$ bundle install`
3. Run: `$ toy_robot`

## Testing

To run all the tests, just use the `$ rake` command inside the app directory.

After running tests, coverage details will be saved into `coverage` dir.
