final int ROWS = 40;
final int COLUMNS = 60;

// Object types.
final int TREASURE = 0;
final int HAZARD = 1;
final int AID = 2;

// Number of particular object type in game.
final int DEFAULT_NUMBER_OF_HAZARDS = 5;
final int DEFAULT_NUMBER_OF_TREASURES = 5;
final int DEFAULT_NUMBER_OF_AID = 10;


// Integer representation of objects in game GRID.
final int COIN = 0;
final int DIAMOND = 1;
final int MINE = 2;
final int OXYGEN_TANK = 3;
final int PLAYER = 4;
final int EMPTY_CELL = 5;

final int [][] GRID = new int[ROWS][COLUMNS];
final int [][] OBJECT_TYPE_AND_NUMBER = { {TREASURE, DEFAULT_NUMBER_OF_TREASURES}, // the OBJECT_TYPE_AND_NUMBER array contains the object type and the number of that type in the game.
                                          {HAZARD, DEFAULT_NUMBER_OF_HAZARDS},
                                          {AID, DEFAULT_NUMBER_OF_AID}};

final int[][] TREASURE_VALUES = { {COIN, 50},
                                  {DIAMOND, 100}};
 
/**
 * This method draws the  game grid.
 */
void drawGrid() {
  
  float xPos = 0, yPos = getDashboardHeight(); 

  for (int i = 0; i < this.GRID.length; i++) {
    for (int j = 0; j < this.GRID[i].length; j++) {
      
      noStroke();
      
      switch(this.GRID[i][j]) {
        
        case PLAYER           : drawPlayer(xPos, yPos);
                                break;
        case COIN             : drawCoin(xPos, yPos);
                                break;
        case DIAMOND          : drawDiamond(xPos, yPos);
                                break;
        case MINE             : drawMine(xPos, yPos);
                                break;
        case OXYGEN_TANK      : drawOxygenTank(xPos, yPos);
                                break;
        default               : drawEmptyCell(xPos, yPos);
                                break;
                                
      }
      
      xPos += getEmptyCellWidth();

    }
    yPos += getEmptyCellHeight();
    xPos = 0;
    
  }
}
/**
 * This method populates the grid randomly with a user specified number of mines and treasures. The program randomly picks either a coin or a diamond as a treasure.
 */
void populateGrid() {
  
  for (int i = 0; i < OBJECT_TYPE_AND_NUMBER.length; i++) {
    int objectType = OBJECT_TYPE_AND_NUMBER[i][0];
    int numberOfobjectType = OBJECT_TYPE_AND_NUMBER[i][1];
    
    for (int j = 0; j < numberOfobjectType; j++) {
      int row = 0, column = 0;
      boolean done = false;
      while(!done) {

       row = (int) random(ROWS);
       column = (int) random(COLUMNS);
       
        if (this.GRID[row][column] == EMPTY_CELL) { // Object can only be placed on empty GRID.
          done = !done;
        }
      }
      switch (objectType) {
        case TREASURE :  this.GRID[row][column] = (int) random(2); // Randomly pick Coin or Diamond
                         break;
        case HAZARD   :  this.GRID[row][column] = MINE;
                         break;
        case AID      :  this.GRID[row][column] = OXYGEN_TANK;
                         break;
      }
    }
  }
}

/**
 * This methods sets the number of objects of a specific type.
 */
void setNumberOfObjects(float mouseXPos, float mouseYPos, float[][] buttonsArray, int objectType) {
  
  for (int i = 0; i < buttonsArray.length; i++) {
    float buttonXPos = buttonsArray[i][0];
    float buttonYPos = buttonsArray[i][1];
    if (mouseXPos >= buttonXPos && mouseXPos <= buttonXPos + buttonWidth && mouseYPos >= buttonYPos && mouseYPos <= buttonYPos + buttonWidth) {
      this.OBJECT_TYPE_AND_NUMBER[objectType][1] = (int) buttonsArray[i][4];
    }
  }
}  

/**
 * This method resets the number of objects to their default values.
 */
void resetNumberOfObjects() {
  
  this.OBJECT_TYPE_AND_NUMBER[TREASURE][1] = DEFAULT_NUMBER_OF_TREASURES;
  this.OBJECT_TYPE_AND_NUMBER[HAZARD][1] = DEFAULT_NUMBER_OF_HAZARDS;
  this.OBJECT_TYPE_AND_NUMBER[AID][1] = DEFAULT_NUMBER_OF_AID;
}



/**
 * This method initializes the game grid with empty cells and sets the player in the grid.
 */
void initGrid(){
  
  for (int i = 0; i < this.GRID.length; i++) {
    for (int j = 0; j < this.GRID[i].length; j++) {
      this.GRID[i][j] = EMPTY_CELL;
    }
  }
  
  this.GRID[getPlayerRow()][getPlayerColumn()] = PLAYER;
}

/**
 * This method returns the number of object of a specific type in the game.
 * @param int the object type.
 * @return int the number of objects of the object type.
 */
int getNumberOfObjects(int objectType) {
  
  return this.OBJECT_TYPE_AND_NUMBER[objectType][1];
}

/**
 * This method returns a value at location (row, column) in the grid.
 * @param int a row number.
 * @param int a column number.
 * @return the value at the location.
 */
int getGridValue(int row, int column) {
  
  return this.GRID[row][column];
}

/**
 * This method return the number of columsn in the grid.
 * @return int the number of columns.
 */
int getNumberOfColumns() {
  
  return this.COLUMNS;
}

/**
 * This method returns the number of rows in the grid.
 * @return the number of rows.
 */
int getNumberOfRows() {
  
  return this.ROWS;
}

/**
 * This method returns the current number of treasures in the game.
 */
int getNumberOfTreasures() {
  
  return this.OBJECT_TYPE_AND_NUMBER[TREASURE][1];
}

/**
 * This method returns the value of a treasure type (COIN or DIAMOND);
 * @param the treasure type.
 * @return int the value of the treasure type.
 */
int getTreasureValue(int treasureType) {
  
  return this.TREASURE_VALUES[treasureType][1];
}

/**
 * This method returns the number of aids in the game.
 * @return int the number of aids.
 */
int getNumberOfAids() {
  
  return this.OBJECT_TYPE_AND_NUMBER[AID][1];
}


void setNumberOfAids(int value) {
  
  this.OBJECT_TYPE_AND_NUMBER[AID][1] = value;
}

/**
 * This method sets the number of treasures.
 * @param int a number.
 */
void setNumberOfTreasures(int value) {
  
  this.OBJECT_TYPE_AND_NUMBER[TREASURE][1] = value;
}

/**
 * This method sets the value for a location (row, column) in the grid.
 * @param int a row value.
 * @param int a column value.
 */
void setGridValue(int row, int column, int value) {
  
  this.GRID[row][column] = value;
}
