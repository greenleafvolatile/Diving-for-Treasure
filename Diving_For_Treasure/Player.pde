final int INITIAL_PLAYER_ROW = 0;
final int INITIAL_PLAYER_COLUMN = 10;

final int[] TREASURES_PICKED_UP = new int[2];

final String DEFAULT_PLAYER_NAME = "Player";

int playerColumn = INITIAL_PLAYER_COLUMN;
int playerRow = INITIAL_PLAYER_ROW;
int previousGridValue = EMPTY_CELL; 

String playerName = DEFAULT_PLAYER_NAME;

long diveTimer = millis();

boolean playerDescend, playerAscend, playerPickedup;

/**
 * This method draws a diver in an empty cell.
 * @param float x-position of the cell.
 * @param float y-position of the cell.
 */
void drawPlayer(float xPos, float yPos) {
  
  final color TEXT_COLOR = #000000;
  final float TEXT_SIZE = getEmptyCellHeight();

  // Draw empty cell.
  drawEmptyCell(xPos, yPos);

  // Draw image of diver in cell.
  PImage playerImage = loadImage("./Resources/scuba512px.png");
  playerImage.resize((int)getEmptyCellWidth(), (int) getEmptyCellHeight());
  image(playerImage, xPos, yPos);
  
  // Show number of treasures picked up.
  textSize(TEXT_SIZE);
  fill(TEXT_COLOR);
  text(getTotalNumberOfTREASURES_PICKED_UP(), xPos, yPos);
  
}

/**
 * This method moves the player in the grid.
 * @param String the direction to move.
 */
void movePlayer(String direction) { // I am not happy with this method. It does too much. Ideally it should only execute the switch statement. Could not come up with a logical way to break it up though (...something something updateGrid() perhaps).
  
  // First set the grid value of the players current location in the grid to the value of the player's previous location in the grid if nothing's been picked up, else set the value of the player's previous location to empty cell.
  if (playerPickedup) {
    setGridValue(this.playerRow, this.playerColumn, EMPTY_CELL);
  } else if (!playerPickedup) {
    setGridValue(this.playerRow, this.playerColumn, this.previousGridValue);
  }

  // Then increase or decrease the player's row or column value.
  switch(direction) {
    
    case "DOWN" : this.playerRow++;
                  break;
    case "UP"   : this.playerRow--;
                  break;
    case "LEFT" : if (this.playerColumn > 0) this.playerColumn--;
                  break;
    case "RIGHT": if (this.playerColumn < getNumberOfColumns() - 1) this.playerColumn++;
                  break;
  }
  
  // Update the value of the player previous location in the grid with the value of the player's current location in the grid.
  previousGridValue = getGridValue(this.playerRow, this.playerColumn);
  
  // If the value of the player's current location in the grid is MINE then reset player (player dies).
  if (getGridValue(this.playerRow, this.playerColumn) == MINE) {
    resetPlayer();
  }
  
  // Set the value of the player's current location in the grid to PLAYER.
  setGridValue(this.playerRow, this.playerColumn, PLAYER);
  
  playerPickedup = false;

  
}
/**
 * This method moves the player either up or down depending on the state of playerAscending and playerDescending.
 */
void playerDive() {
  
  final int DIVE_INTERVAL = 500;

  if (millis() - diveTimer > DIVE_INTERVAL) {
    
    if (playerDescend) {
      
      if (this.playerRow < getNumberOfRows() - 1) {
        movePlayer("DOWN");
      }
      
      if (this.playerRow == getNumberOfRows() - 1) {
        playerDescend = false;
      }
      
    } else if (playerAscend) {
      
      if (getPlayerRow() > 0) {
        movePlayer("UP");
      }
      
      if (this.playerRow == 0) { // If the player has ascended to the surface, set oxygenbar to full, update the player score and reset the number of treasures picked up to 0. 
        setOxygenBarReductionRate(0);
        setPlayerScore(getPlayerScore() + calculatePickedupTreasureValue());
        resetNumberOfTreasuresPickedup();
        playerAscend = false;
      }
    }
    diveTimer = millis();
  }
}

/**
 * This methods resets the player's state after he has died.
 */
void resetPlayer() { 
  
  setNumberOfLives(getNumberOfLives() - 1);
  
  // Set grid to previous value. Else two player images will be drawn next time draw() is called.
  setGridValue(this.playerRow, this.playerColumn, previousGridValue);
  
  // Reset the player's location to starting location.
  this.playerRow = INITIAL_PLAYER_ROW;
  this.playerColumn = INITIAL_PLAYER_COLUMN;
  
  // Set grid value of the player's reset location to PLAYER value.
  setGridValue(this.playerRow, this.playerColumn, PLAYER);
  
  // Reset previous grid value to Empty Cell.
  this.previousGridValue = EMPTY_CELL;
  
  // Set oxygenbar to full
  setOxygenBarReductionRate(0);
  
  // Set the number of picked up treasures to 0.
  resetNumberOfTreasuresPickedup();
  
  // Set playerAscend and playerDescend states to false.
  playerAscend = false;
  playerDescend = false;
}

/** 
 * This method sets the player name to the default value.
 */
void resetPlayerName() {
  
  this.playerName = DEFAULT_PLAYER_NAME;
}

/**
 * This methods calculates the value of the treasures the player picked up.
 * @return int the value of all the treasures the player picked up.
 */
int calculatePickedupTreasureValue() {
  
  int sum = 0;
  for (int i = 0; i < TREASURES_PICKED_UP.length; i++) {
    sum += TREASURES_PICKED_UP[i] * getTreasureValue(i);
  }
  return sum;
}

/**
 * This methods set the number of picked up treasures to 0.
 */
void resetNumberOfTreasuresPickedup() {
  
  for (int i = 0; i < TREASURES_PICKED_UP.length; i++) {
    TREASURES_PICKED_UP[i] = 0;
  }
}

/**
 * This method sets playerPickedup.
 * @param boolean.
 */
void setPlayerPickup(boolean value) {
  
  this.playerPickedup = value;
}

/** 
 * This method sets playerDescend.
 * @param boolean.
 */
void setPlayerDescend(boolean value) {
  
  this.playerDescend = value;
}

/**
 * This method set's the value of playerAscend.
 * @param boolean.
 */
void setPlayerAscend(boolean value) {
  
  this.playerAscend = value;
}


/**
 * This method sets the player's name.
 * @param String a name.
 */
void setPlayerName(String name) {
  
  this.playerName = name;
}

/**
 * This method sets the number of treasures picked up of a specific type.
 * @param int treasure type.
 * @param int the number of treasures of a specific type.
 */
void setNumberOfTreasuresPickedup(int treasureType, int number) {
  
  this.TREASURES_PICKED_UP[treasureType] += number; 
}

/**
 * This methods returns the total number of treasures picked up.
 * @return int the total number of treasures picked up.
 */
int getTotalNumberOfTREASURES_PICKED_UP() {
  
  int sum = 0;
  for (int i = 0; i < TREASURES_PICKED_UP.length; i++) {
    sum += TREASURES_PICKED_UP[i];
  }
  return sum;
}

/**
 * This method returns the players row position.
 * @return int a row value.
 */
int getPlayerRow() {
  
  return this.playerRow;
}

/**
 * This method return the player's column position.,
 * @return int a column value.
 */
int getPlayerColumn() {
  
  return this.playerColumn;
}

/** 
 * This method returns the value of the cell in the gamegrid that player moves to before that cell is assigned the PLAYER value.
 * @return int the previous grid value.
 */
int getPreviousGridValue() { // This method's name indicates it should be in GameGrid not in Player.
  return this.previousGridValue;
}

/**
 * This method return the value of the initial player column (at the beginning of the game).
 * @return int INITIAL_PLAYER_COLUMN.
 */
int getInitialPlayerColumn() {
  
  return this.INITIAL_PLAYER_COLUMN;
}
/**
 * This method returns the player's name.
 * @return String playerName;
 */
String getPlayerName() {
  
  return this.playerName;
}

/**
 * This method returns true if the player pickedup  a treasure or oxygen tank, else false.
 * @return boolean playerPickedup.
 */
boolean isPlayerPickup() {
  
  return this.playerPickedup;
}




  
  
    
