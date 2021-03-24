final float[] QUIT_BUTTON_DATA = new float[4];
final float[] PLAY_AGAIN_BUTTON_DATA = new float[4];

void drawEndScreen(float screenWidth, float screenHeight) {
  
  // Define general config and offset values.
  final float TEXT_SIZE = screenHeight / 8; 
  final float V_PADDING = screenHeight / 30;
  final float H_PADDING = screenWidth / 10;
  final float MARGIN = screenWidth / 10;
  final color SCREEN_COLOR = #000000;
  final color TEXT_COLOR = #FF0000;
  
  // Define play again button config values.
  final String PLAY_AGAIN_BUTTON_TEXT = "AGAIN!";
  final color PLAY_AGAIN_BUTTON_COLOR = #FF0000;
  final color  PLAY_AGAIN_BUTTON_TEXT_COLOR = #000000;
  
  // Define quit button values.
  final String QUIT_BUTTON_TEXT = "QUIT!";
  final color QUIT_BUTTON_COLOR = #FF0000;
  final color QUIT_BUTTON_TEXT_COLOR = #000000;
  
  // Define text config values.
  final float SCORE_TEXT_SIZE = TEXT_SIZE / 2;
  final float HIGH_SCORES_TEXT_SIZE = TEXT_SIZE / 4;
  final String HIGH_SCORES_TEXT = "Highscores: ";
  final String SCORE_TEXT = "Your score: " + getPlayerScore();
  final color SCORE_TEXT_COLOR = #0000FF;
  final color HIGH_SCORES_TEXT_COLOR = #00FF00;
  
  background(SCREEN_COLOR);
  textSize(TEXT_SIZE);

  String mainText = "";
  if (getNumberOfTreasures() == 0) {
    mainText = "YOU WIN!";
  } else if (getNumberOfLives() == 0) {
    mainText = "YOU LOSE!";
  }
  
  // Show win / lose text.
  float textXPos = screenWidth / 2 - textWidth(mainText) / 2;
  float textYPos = MARGIN;
  showText(mainText, textXPos, textYPos, TEXT_SIZE, TEXT_COLOR);
  
  // Show player score.
  textSize(SCORE_TEXT_SIZE);
  showText(SCORE_TEXT, screenWidth / 2 - textWidth(SCORE_TEXT) / 2, textYPos + SCORE_TEXT_SIZE + V_PADDING, SCORE_TEXT_SIZE, SCORE_TEXT_COLOR);
  
  // Show  highscore text.
  textSize(HIGH_SCORES_TEXT_SIZE);
  showText(HIGH_SCORES_TEXT, screenWidth / 2 - textWidth(HIGH_SCORES_TEXT) / 2, textYPos + SCORE_TEXT_SIZE + HIGH_SCORES_TEXT_SIZE + V_PADDING * 2  , HIGH_SCORES_TEXT_SIZE, HIGH_SCORES_TEXT_COLOR);
  
  // Show highscores.
  showHighscores(screenWidth, screenWidth / 2 - textWidth(HIGH_SCORES_TEXT) / 2, textYPos + SCORE_TEXT_SIZE + HIGH_SCORES_TEXT_SIZE + V_PADDING * 4, HIGH_SCORES_TEXT_SIZE);
  
  // Initialize and draw play again button.
  PLAY_AGAIN_BUTTON_DATA[0] = MARGIN + H_PADDING;
  PLAY_AGAIN_BUTTON_DATA[1] = screenHeight - MARGIN - screenHeight / 8;
  PLAY_AGAIN_BUTTON_DATA[2] = (screenWidth / 4);
  PLAY_AGAIN_BUTTON_DATA[3] = screenHeight / 8;
  drawButton(PLAY_AGAIN_BUTTON_DATA, PLAY_AGAIN_BUTTON_TEXT, PLAY_AGAIN_BUTTON_COLOR, PLAY_AGAIN_BUTTON_TEXT_COLOR);
  
  // Initialize and draw quit button.
  QUIT_BUTTON_DATA[3] = screenHeight / 8;
  QUIT_BUTTON_DATA[2] = screenWidth / 4;
  QUIT_BUTTON_DATA[1] = screenHeight - MARGIN - screenHeight / 8;
  QUIT_BUTTON_DATA[0] = screenWidth - MARGIN - H_PADDING - QUIT_BUTTON_DATA[2];
  drawButton(QUIT_BUTTON_DATA, QUIT_BUTTON_TEXT, QUIT_BUTTON_COLOR, QUIT_BUTTON_TEXT_COLOR);
  
}
/**
 * This method print the highscores to the screen.
 * @param float the screen width.
 * @param float the y-position of the first line.
 * @param float the text size.
 */
void showHighscores(float screenWidth, float xPos, float yPos, float textSize) {
  
  final color TEXT_COLOR = #F13EEC;
  final float H_PADDING = screenWidth / 80;
  textSize(textSize);
  fill(TEXT_COLOR);
  
  float textWidth = getLongestNameWidth(); // Need to know longest name width in order to align names and scores in two columns.
  
  for (int i = 0; i < getHighscores().length; i++) {
    
    String name = getHighscores()[i][0];
    String score = getHighscores()[i][1];
    text(name, xPos, yPos);
    text(score, xPos + textWidth + H_PADDING, yPos);

    yPos += textSize;
  }
}

/**
 * This method returns the play again button data.
 * @return float play again button data.
 */
float[] getPlayAgainButtonData() {
  
  return this.PLAY_AGAIN_BUTTON_DATA;
}

/** 
 * This method returns the quit button data.
 * @return the quit button data.
 */
float[] getQuitButtonData() {
  
  return this.QUIT_BUTTON_DATA;
}

/** 
 * This method is a helper method that is needed to cleanly align the player's scores on the screen.
 * @return float the lenght of the longenst name in the highscores list.
 */
float getLongestNameWidth() {
  
  float longestWidth = textWidth(getHighscores()[0][0]);
  for (int i = 0; i < getHighscores().length; i++) {
    if (textWidth(getHighscores()[i][0]) > longestWidth) {
      longestWidth = textWidth(getHighscores()[i][0]);
    }
  }
  return longestWidth;
}

  
  
