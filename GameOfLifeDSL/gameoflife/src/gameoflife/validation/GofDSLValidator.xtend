/*
 * generated by Xtext 2.25.0
 */
package gameoflife.validation

import gameoflife.gofDSL.Condition
import org.eclipse.xtext.validation.Check
import gameoflife.gofDSL.GridElem
import gameoflife.gofDSL.Model
import gameoflife.gofDSL.Rules

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class GofDSLValidator extends AbstractGofDSLValidator {
	val boolean[] mentioned = #[false,false,false, false,false,false ,false,false,false]
	
	@Check
	def checkNeigbourAmount(Condition cond) {
		if(cond.value > 8 && cond.sign != '<' && cond.sign != '<=') {
			warning('Amount of neighbours is invalid and will be ignored',null)
		}
		if(cond.value > 8 && (cond.sign == '<' || cond.sign == '<=')) {
			info('Logically equivalent to the condition (<= 8)', null)
		}
	}
	
	@Check
	def checkOutOfBounds(GridElem gridElem) {
		if(gridElem.x > 75 || gridElem.y > 50) {
			warning('Out of bounds line will be ignored', null)
		}
	}
	
	@Check 
	def checkAllMentioned(Rules rule) {
		//rule.rules.forEach[element, index | if (mentioned[element.cond.value] == false) {}]
	}
	
	@Check
	def checkNotSameCellTwice(Model mod) {
		//val boolean[] myList = newBooleanArrayOfSize(400);
		//mod.startingGrid.forEach[ element, index | if (myList[element.x] == false) { myList[element.y] = true } else {warning('duplicate',null)}]
	}
	
	@Check
	def checkEmptyGrid(Model mod) {
		if (mod.startingGrid.isEmpty) {
			info('Empty grid', null);
		}
	}
	
}
