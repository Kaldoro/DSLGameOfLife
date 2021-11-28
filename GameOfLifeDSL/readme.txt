We changed the GameOfLife.java file so use ours :)


Language:
Example of rules being defined:
"
Rules:
	Live when (<= 4)
	Die  when (== 2)
	Birth when (> 7)
"
Order does matter in the rules in this instance Die when (==2) will override the Live rule.

Ecample of grid being defined:
"
Grid:
	Pattern:
	Line ..##..
	Line .##..
	(5,5)
	Cell(3,3)
	Glider(7,7)
	Toad(8,8)
"


Generation:
We only generate the RulesOfLive.java file. Cells defined outside of the grid will not be generated, just as the warning would imply. 
Same goes for useless rules like Live when (>= 50) they will not be generated since they do not do anything.

Validation:
If you have a condition like for example (>= 50) it will give warning that it will be ignored which it litterly will be

If you have a condition like (< = 50) it will give an info that it is logically equivalent to (<= 8)

If you have cell which you define outside the bounds of the screen like Cell(500,500) it will give a warning that it is out of bounds and will be ignored

If you have like on rule for example Live when ( <= 4) then it will give an info on the entire ruleset that values (5,6,7,8) are not mentioned and that the default scenario will  be death

If you have only rules and no grid or a grid without any cells defined then you will get as info that the entire grid is empty.