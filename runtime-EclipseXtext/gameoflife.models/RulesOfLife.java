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
                if ((!gameBoard[i][j]) && (surrounding == 3)){
                	survivingCells.add(new Point(i-1,j-1));
                	}
                if ((gameBoard[i][j]) && (surrounding == 3)){
                	survivingCells.add(new Point(i-1,j-1));
                	}
                if ((gameBoard[i][j]) && (surrounding == 1)){
                	survivingCells.add(new Point(i-1,j-1));
                	}
                if ((gameBoard[i][j]) && (surrounding < 50)){
                	survivingCells.add(new Point(i-1,j-1));
                	}
               //END GENERATED CONTENT
               }
       	   }
         }
public static void initializeGrid(GameBoard gameBoard) {
    // GENERATED CONTENT 
        gameBoard.addPoint(2,2);
        gameBoard.addPoint(1,1);
        gameBoard.addPoint(1,2);
        gameBoard.addPoint(2,1);
        gameBoard.addPoint(3,4);
        gameBoard.addPoint(2,4);
        gameBoard.addPoint(1,4);
        gameBoard.addPoint(0,4);
        gameBoard.addPoint(4,4);
        gameBoard.addPoint(4,3);
        gameBoard.addPoint(4,3);
        gameBoard.addPoint(4,2);
        gameBoard.addPoint(4,1);
        gameBoard.addPoint(4,0);
        // END GENERATED CONTENT
}
  }
