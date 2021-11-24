package gameoflife.generator

import gameoflife.gofDSL.Model

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
                «FOR p : root.rules»
                «IF (p.cond.value < 8 || p.cond.sign == '<' || p.cond.sign == '<=')»
                «IF p.option == "Birth"»
                if ((!gameBoard[i][j]) && (surrounding «p.cond.sign» «p.cond.value»)){
                	survivingCells.add(new Point(i-1,j-1));
                }
                «ENDIF» 
                «IF p.option == "Live"»
                if ((gameBoard[i][j]) && (surrounding «p.cond.sign» «p.cond.value»)){
                	survivingCells.add(new Point(i-1,j-1));
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
		«FOR p : root.startingGrid»
		«IF p.x < 76 && p.y < 51»
		gameBoard.addPoint(«p.x»,«p.y»);
		«ENDIF»
		«ENDFOR»
		// END GENERATED CONTENT
	}
}
	'''
}