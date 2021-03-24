final int SETTINGS_SCREEN = 0; // Constants for determining game state.
final int GAME_SCREEN = 1;
final int END_SCREEN = 2;

int screen = SETTINGS_SCREEN;


void setup() {
  
  size(1000, 1000, P2D); // Game can be resized as long as width is equal to height.
  
  surface.setTitle("Diving For Treasure");
  
  // Initialize variables that depend on size settings.
  setDashboardHeight(width / 6);
  setEmptyCellWidth(width / (float) getNumberOfColumns());
  setEmptyCellHeight((height - getDashboardHeight()) / (float) getNumberOfRows());
  
  // Initialize the grid
  initGrid(); 
  
  // Load highscores.
  loadHighscores();
  
  /****************************************
   * // Test cases                        * 
   * testFindIndexToInsertScore();        *
   * testAddToHighscores();               *
   * testCalculatePickedupTreasureValue();* 
  *****************************************/
  
}

void draw() {
  
  clear(); 
  
  switch(this.screen) {
    
    case SETTINGS_SCREEN  : drawSettingsScreen(width, height);
                            break;
    case GAME_SCREEN      : drawDashboard(width);
                            drawGrid();
                            reduceOxygenBar();
                            applyCurrent();
                            playerDive();
                            checkEndGameConditions();
                            break;
    case END_SCREEN       : drawEndScreen(width, height);
                            break;
  }
}


@Override
void keyPressed() {
  
  if (screen == GAME_SCREEN) {
    
    if (keyCode == TAB) { // Pressing TAB allows a player to pickup coins, diamonds and oxygentanks.
      
      if (!isPlayerPickup()) {  
        
       switch (getPreviousGridValue()) {
          
          case COIN        : 
          case DIAMOND     : setNumberOfTreasuresPickedup(getPreviousGridValue(), 1); // Player's new location in the grid has e.g. DIAMOND value. before that location in the grid is assigned PLAYER value the DIAMOND value is assigned to previousGrid.
                             setNumberOfTreasures(getNumberOfTreasures() - 1);
                             break;
          case OXYGEN_TANK : setOxygenBarReductionRate(0);
                             setNumberOfAids(getNumberOfAids() - 1);
                             break;
        }
        
        setPlayerPickup(true);
      }
    } else if (keyCode == DOWN) { // Pressing down arrow key makes the player start to descend.
      
      if (getPlayerRow() == 0) {
        startWaterCurrentTimer();
        setPlayerDescend(true); 
      }
    } else if (keyCode == UP) { // Pressing up arrow key makes the player start to ascend.
      
      if (getPlayerRow() == getNumberOfRows() - 1) {
        setPlayerAscend(true);
      }
    } else if (getPlayerRow() > 0 && getPlayerRow() < getNumberOfRows() - 1) { 
      
      if (keyCode == RIGHT) { // Pressing right arrow key moves the player to the right.
        movePlayer("RIGHT");
      } else if (keyCode == LEFT) { // Pressing left arrow key moves the player to the left.
        movePlayer("LEFT");
      }
    }
  
    
  } else if (screen == SETTINGS_SCREEN) {
   
    if ((key >= 97 && key <= 122) || (key >= 65 && key <= 90)) { // Player can only enter a-z or A-Z for player name.
      
      textSize(getTextfieldTextSize());
      
      if (textWidth(getPlayerName() + key) < getTextfieldWidth() - getCaretWidth()) { 
        
        setPlayerName(getPlayerName() + key); 
      }
      
    } else if (key == BACKSPACE) { // Pressing backspace deletes a char from the player's namem.
      
      if (getPlayerName().length() >= 1) {
          setPlayerName(getPlayerName().substring(0, playerName.length() - 1));
      }
      
    } else if (keyCode == ENTER) { // Pressing enter starts the game.
        initGame();
    }
  }
}

@Override
void mousePressed() {
  
  final float mouseXPos = mouseX;
  final float mouseYPos = mouseY;
 
  if (this.screen == SETTINGS_SCREEN) {
    // Startbutton
    if (isOverButton(getStartButtonData(), mouseXPos, mouseYPos)) {
      initGame();
      // Number of treasures buttons.
    } else if (isOverButtonBar(getTreasuresButtonBarData(), mouseXPos, mouseYPos)) { 
      setNumberOfObjects(mouseXPos, mouseYPos, getTreasuresButtonBarData(), TREASURE);
      // Number of hazards buttons.
    } else if (isOverButtonBar(getHazardsButtonBarData(), mouseXPos, mouseYPos)) {
      setNumberOfObjects(mouseXPos, mouseYPos, getHazardsButtonBarData(), HAZARD);
      
    }
    
  } else if (this.screen == END_SCREEN) {
    // Quitbutton
    if (isOverButton(getQuitButtonData(), mouseXPos, mouseYPos)) {
      exit();
      // Play again button.
    } else if (isOverButton(getPlayAgainButtonData(), mouseXPos, mouseYPos)) {
      resetGameState();
    }
  }
}


/**
 * This method checks if the endgame conditions are met (player has no lives left or there are no treasure left in the water).
 */
void checkEndGameConditions() {
 
  if (getNumberOfTreasures() == 0 && getPlayerRow() == 0 || getNumberOfLives() == 0) {
    
    String[] score = {getPlayerName(), String.valueOf(getPlayerScore())};
    
    if (isHighscore(score)) {
      addToHighscores(score);
      saveHighscores();
    }
    this.screen = END_SCREEN;
  }
}

/**
 * This method resets the game state to the begin state.
 */
void resetGameState() {
  
  initGrid();
  resetNumberOfLives();
  resetNumberOfObjects();
  resetNumberOfTreasuresPickedup();
  resetPlayerName();
  setPlayerScore(0);
  this.screen = SETTINGS_SCREEN;
}

/**
 * This method initializes the game with the player provided settings.
 */
void initGame() {
 
  populateGrid();
  screen = GAME_SCREEN;
}











    



  
  
      
