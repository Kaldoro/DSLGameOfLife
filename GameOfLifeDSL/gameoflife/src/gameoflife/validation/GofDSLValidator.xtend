/*
 * generated by Xtext 2.25.0
 */
package gameoflife.validation

import gameoflife.gofDSL.Condition
import org.eclipse.xtext.validation.Check
import gameoflife.gofDSL.GridElem
import gameoflife.gofDSL.Rules
import java.util.HashMap; 
import java.util.ArrayList;
import gameoflife.gofDSL.Model

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class GofDSLValidator extends AbstractGofDSLValidator {
	@Check
	def checkNeigbourAmount(Condition cond) {
		//If you have a condition like for example (>= 50) it will give warning that it will be ignored
		if(cond.value > 8 && cond.sign != '<' && cond.sign != '<=') {
			warning('Amount of neighbours is invalid and will be ignored',null)
		}
		//If you have a condition like (< = 50) it will give an info that it is logically equivalent to (<= 8)
		if(cond.value > 8 && (cond.sign == '<' || cond.sign == '<=')) {
			info('Logically equivalent to the condition (<= 8)', null)
		}
	}
	
	//Will check when a cell is out of bounds based on the initial size the grid has for us atleast
	@Check
	def checkOutOfBounds(GridElem gridElem) {
		if(gridElem.x > 75 || gridElem.y > 50) {
			warning('Out of bounds line will be ignored', null)
		}
	}
	
	//Check whether a value is given for each possible amount of neighbours otherwise it gives info with the missing numbers
	@Check 
	def checkAllMentioned(Rules ruleList) {
		var mentioned = new ArrayList<Boolean>();
		for(var i = 0; i < 9; i++) {
			mentioned.add(false);
		}
		
		var rules = ruleList.rules;
		if(rules !== null && !rules.isEmpty) {
			for(elem : rules) {
				var index = elem.cond.value
				var sign = elem.cond.sign
				if(sign == '==') {
					if(index < 9 && mentioned.get(index) == false) {mentioned.set(index, true)}
				}
				else if(sign == '>'  && index < 8) {
					for(var i=index+1; i < 9; i++) {
						mentioned.set(i, true)
					}
				}
				else if(sign == '>='  && index < 8) {
					for(var i=index; i < 9; i++) {
						mentioned.set(i, true)
					}
				}
				else if(sign == '<' ) {
					var temp = index;
					if(index > 9) { temp = 9 }
					for(var i=temp-1; i >= 0; i--) {
						mentioned.set(i, true)
					}
				}
				else if(sign == '<=' ) {
					var temp = index;
					if(index > 9) { temp = 9 }
					for(var i=temp; i >= 0; i--) {
						mentioned.set(i, true)
					}
				}
			}
			var output = "Values not mentioned in any rule: ";
			var any = false;
			for(var i=0; i < 9; i++) {
				if(mentioned.get(i) == false) {
					any = true
					output += i.toString() + " , "
				}
			}
			if(any) {
				info(output + "default will be death", ruleList, null)
			}
		}
	}
	
	//Does not work ); 
	@Check
	def checkNotSameCellTwice(Model mod) {
		var grid = mod.startingGrid;
		if(!grid.isEmpty) {
			var map = new HashMap<String, Boolean>();
			for(elem : grid) {
				var line = elem.x.toString() + "," + elem.y.toString()
				if (map.get(line) == true) {
					warning('Setting the same cell twice', elem, null)
				} 
				else {
					map.put(line, true)
				};
			}
		}
	}
	
	//Gives info that the grid is empty if it is
	@Check
	def checkEmptyGrid(Model mod) {
		if (mod.startingGrid.isEmpty) {
			info('Empty grid', null);
		}
	}
	
}
