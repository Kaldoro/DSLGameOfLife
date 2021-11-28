package gameoflife.generator

import gameoflife.gofDSL.Model
import java.util.ArrayList

class JavaGenerator {
	def static toRulesFile(Model root) ''' 
	package GameOfLife;

	import java.awt.Point;
	import java.util.ArrayList;
	import GameOfLife.GameOfLife.GameBoard;

	public class RulesOfLife {
		public static void computeSurvivors(boolean[][] gameBoard, ArrayList<Point> survivingCells) {
		// Iterate through the array, follow game of life rules
		for (int i=1; i<gameBoard.length-1; i++) {
			for (int j=1; j<gameBoard[0].length-1; j++) {
				int surrounding = 0;
				if (gameBoard[i-1][j-1]) { surrounding++; }
				if (gameBoard[i-1][j])   { surrounding++; }
				if (gameBoard[i-1][j+1]) { surrounding++; }
				if (gameBoard[i][j-1])   { surrounding++; }
				if (gameBoard[i][j+1])   { surrounding++; }
				if (gameBoard[i+1][j-1]) { surrounding++; }
				if (gameBoard[i+1][j])   { surrounding++; }
				if (gameBoard[i+1][j+1]) { surrounding++; }
				/* only code for surviving cells, so no rule if result is dead cell */

				// GENERATED CONTENT
                «FOR p : root.ruleList.rules»
	                «IF (p.cond.value < 8 || p.cond.sign == '<' || p.cond.sign == '<=')»
		                «IF p.option == "Birth"»
		                if ((!gameBoard[i][j]) && (surrounding «p.cond.sign» «p.cond.value»)){
						survivingCells.add(new Point(i-1,j-1));
						}
		                «ELSEIF p.option == "Live"»
		                if ((gameBoard[i][j]) && (surrounding «p.cond.sign» «p.cond.value»)){
		                	survivingCells.add(new Point(i-1,j-1));
		                }
		                «ELSEIF p.option == "Die"»
		                if (surrounding «p.cond.sign» «p.cond.value») {
		                	survivingCells.remove(new Point(i-1,j-1));
		                }
		                «ENDIF»
	   				«ENDIF»
                «ENDFOR»
				//END GENERATED CONTENT
			}
		}
	}
	public static void initializeGrid(GameBoard gameBoard) {
	    // GENERATED CONTENT 
		«FOR elem : root.startingGrid»
		«IF elem.x < 76 && elem.y < 51»
			«IF elem.content.shape !== null»
				insertShape(gameBoard, "«elem.content.shape.name»", «elem.x», «elem.y»);
			«ELSEIF elem.content.cell !== null»
				gameBoard.addPoint(«elem.x»,«elem.y»);
			«ELSEIF elem.content.pattern !== null»
				«var offset = 0»
				«FOR pline : elem.content.pattern.patternData»
					insertPattern(gameBoard, "«pline»", «elem.x», «elem.y + offset»);
					«{offset += 1; ""}» ««« not ideal but https://stackoverflow.com/a/19176838/9139701
				«ENDFOR»
			«ENDIF»
		«ENDIF»
		«ENDFOR»
		// END GENERATED CONTENT
	}
	
	private static void insertShape(GameBoard gameBoard, String shape, int x, int y){
		if (shape == "Glider"){
			gameBoard.addPoint(x+1, y);
			gameBoard.addPoint(x+2, y+1);
			gameBoard.addPoint(x, y+2);
			gameBoard.addPoint(x+1, y+2);
			gameBoard.addPoint(x+2, y+2);
		}
		else if (shape == "Toad"){
			gameBoard.addPoint(x+1, y);
			gameBoard.addPoint(x+2, y);
			gameBoard.addPoint(x+3, y);
			gameBoard.addPoint(x, y+1);
			gameBoard.addPoint(x+1, y+1);
			gameBoard.addPoint(x+2, y+1);
		}
	}
	
    private static void insertPattern(GameBoard gameBoard, String pattern, int x, int y){
        int minDot = pattern.indexOf('.');
        int minHash = pattern.indexOf('#');
        int indexStart;
        if(minDot == -1){
            if(minHash == -1) {return;}
            indexStart = minHash;
        }
        else if(minHash == -1) {return;} // if there are no # in the pattern, no cells will get filled so return.
        else {
            indexStart = Math.min(minDot, minHash);
        }
        String patternData = pattern.substring(indexStart);
        
        for(int i = 0; i < patternData.length(); i++) {
        	if (patternData.charAt(i) == '#') {
        		gameBoard.addPoint(x+i, y);
        	}
        }
    }
}
	'''
	def static void doSomething() {
		var al = new ArrayList<Integer>();
	}
}