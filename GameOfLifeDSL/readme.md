# Game of Life DSL
Authors: Danny van Veltum, Louis Machiels

Open the DSLGameOfLife directory as the Eclipse workspace.

We changed the GameOfLife.java file so please use ours.

## Language:
Example of rules being defined:
```
Rules:
	Live when (<= 4)
	Die  when (== 2)
	Birth when (> 7)
```
Order does matter in the rules. In this instance Die when (==2) will override the Live rule.

Supported operators are: `'>=' | '<=' | '>' | '<' | '=='`.

Example of grid being defined:
```
Grid:
	Pattern:
	Line ..##..
	Line .##..
	(5,5)
	Cell(3,3)
	Glider(7,7)
	Toad(8,8)
```
There are 3 different classes that can be defined on the grid:
- A cell which is a 1x1 living area.
- A predefined shape of which there currently are two:
  - The `Glider`
  - The `Toad`
- A pattern. Patterns are of the form `Pattern: (Line (.|#)*)+` in which a dot represents an empty cell and a # represents a living cell. Every line of the pattern is a new line on the y axis. It is possible to define an empty Line to fill a line with nothing.
  
All elements have to define a coordinate `(x, y)` at the end of their description. This coordinate is the top-left cell from which the element will be drawn.

Empty cells in a pattern or shape will not overwrite living cells defined by any other element. This could be amended by adding an `Empty` element, but it would not have many realistic use cases.

### On the subject of patterns
Patterns can be useful to manually create your own structures with, but their real usefulness is in the ability to copy patterns from the Game of Life wiki. Many game of life patterns on the wiki have pattern files available, for example [the Period-22 glider gun](https://conwaylife.com/wiki/Period-22_glider_gun). On the wiki, unfold to show the Pattern files, and click the link to [the plaintext pattern](https://www.conwaylife.com/patterns/trueperiod22gun.cells).

The pattern should look like this:
```
!Name: True period 22 gun
!Author: David Eppstein
!The first true period 22 gun constructed. Found in August 2000.
!www.conwaylife.com/wiki/index.php?title=True_period_22_gun
..................OO
...................O.......O
...................O.O..............OO
....................OO............OO..O
........................OOO.......OO.OO
........................OO.OO.......OOO
........................O..OO............OO
.........................OO..............O.O
...................................O.......O
...........................................OO

OO.......................O
.O.....................O.O
.O.O.............OOO....OO
..OO...O........O...O
......O.OO......O....O
.....O....O......OO.O.........O
......O...O........O...OO......O
.......OOO.............O.O...OOO
.........................O
.........................OO
```
Unfortunately we could not find an error free way for Xtext to parse the pattern as-is, so you will have to copy the pattern content, find-and-replace the `O` with `#`, and add `Line` in front of the pattern lines. In Eclipse you can use `Alt-Shift-A` to enter multiple-cursor editing mode to make this easier.

## Generation:
We only generate the RulesOfLive.java file. Cells defined outside of the grid will not be generated, just as the IDE warning implies.
The same goes for useless rules like `Live when (>= 50)` they will not be generated since they do not do anything.

## Validation:
If you have an impossible condition for example (>= 50), it will provide a warning that it will be ignored.

If you have a condition like (<= 50) it will give an info that it is logically equivalent to (<= 8).

If you have cell which you define outside the bounds of the screen like Cell(500,500) it will give a warning that it is out of bounds and will be ignored.

If you have any unspecified values, e.g. just `Live when ( <= 4)` then it will give an info on the entire ruleset that values (5,6,7,8) are not mentioned and that the default scenario will  be death.

If you have only rules and no grid or a grid without any cells defined then you will get as info that the entire grid is empty.