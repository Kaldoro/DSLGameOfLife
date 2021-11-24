/*
 * generated by Xtext 2.25.0
 */
package gameoflife.validation

import gameoflife.gofDSL.Condition
import org.eclipse.xtext.validation.Check
import gameoflife.gofDSL.GridElem

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class GofDSLValidator extends AbstractGofDSLValidator {
	
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
	def checkOutOfBounds(GridElem cell) {
		if(cell.x > 75 || cell.y > 50) {
			warning('Out of bounds line will be ignored', null)
		}
	}
	
//	public static val INVALID_NAME = 'invalidName'
//
//	@Check
//	def checkGreetingStartsWithCapital(Greeting greeting) {
//		if (!Character.isUpperCase(greeting.name.charAt(0))) {
//			warning('Name should start with a capital', 
//					GofDSLPackage.Literals.GREETING__NAME,
//					INVALID_NAME)
//		}
//	}
	
}
