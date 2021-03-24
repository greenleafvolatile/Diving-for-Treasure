final int DEFAULT_NUMBER_OF_LIVES = 3;
float dashboardHeight; 
int playerScore = 0; 
int numberOfLives = DEFAULT_NUMBER_OF_LIVES;

/**
 * This method draws the dashboard.
 * @param float the width of the dashboard.
 */
void drawDashboard(float dashboardWidth) { 
  
  // Define config and offset values.
  final color DASHBOARD_TEXT_COLOR = #000000;
  final color DASHBOARD_BORDER_COLOR = #0000FF;
  final float DASHBOARD_TEXT_SIZE = dashboardHeight / 10;
  final float V_PADDING = dashboardHeight / 25;
  final float DASHBOARD_BORDER_WIDTH = 6;
  final float H_MARGIN = dashboardWidth / 150;
  float xPos = 0; 
  float yPos = 0;
  
  // Draw the dashboard with a blue border representing the waterline.
  stroke(DASHBOARD_BORDER_COLOR);
  strokeWeight(DASHBOARD_BORDER_WIDTH);
  fill(#FFFFFF);
  rect(xPos, yPos, dashboardWidth, dashboardHeight);
  
  // Draw stats on the dashboard.
  fill(DASHBOARD_TEXT_COLOR); 
  textSize(DASHBOARD_TEXT_SIZE);
  // Show the player's name.
  text("Player one: " + playerName, H_MARGIN, DASHBOARD_TEXT_SIZE); 
  // Show the player's number of lives.
  text("Lives: " + numberOfLives, H_MARGIN, DASHBOARD_TEXT_SIZE * 2 + V_PADDING);
  // Show the player's score.
  text("Score: " + playerScore, H_MARGIN, DASHBOARD_TEXT_SIZE * 3 + V_PADDING * 2); 
  
  final String TEXT = "O2";  
  text(TEXT, H_MARGIN, DASHBOARD_TEXT_SIZE * 4 + V_PADDING * 3.5);
  
  // Draw the oxygenbar.
  drawOxygenBar(H_MARGIN, DASHBOARD_TEXT_SIZE * 4 + V_PADDING * 4, textWidth(TEXT), this.dashboardHeight - DASHBOARD_TEXT_SIZE * 4 - V_PADDING * 4 - V_PADDING);
  
  // Draw a boat at the player's location.
  drawBoat();
  
  // Draw a sun on the dashboard.
  drawSun(dashboardWidth, this.dashboardHeight);
  
}

/**
 * This method resets the number to the default number of lives.
 */
void resetNumberOfLives() {
  
  this.numberOfLives = DEFAULT_NUMBER_OF_LIVES;
}

/**
 * This method sets the dashboard's height.
 * @param float the height of the dasboard.
 */
void setDashboardHeight(float dashboardHeight) {
  
  this.dashboardHeight = dashboardHeight;
}

/**
 * This method sets the player's score.
 * @param int the score.
 */
void setPlayerScore(int value) { // Should this be in Player instead?

  this.playerScore = value;
}

/**
 * This method set's the number of lives.
 * @param int the number of lives.
 */
void setNumberOfLives(int value) {
  
  this.numberOfLives = value;
}

/**
 * This method return the dashboard's height.
 * @return float the height of the dashboard.
 */
float getDashboardHeight() {
  
  return this.dashboardHeight;
}


/**
 * This method returns the player's score.
 * @return int the player's score.
 */
int getPlayerScore() {
  
  return this.playerScore;
}

/**
 * This method returns the number of lives.
 * @return int the number of lives.
 */
int getNumberOfLives() {
  
  return this.numberOfLives;
}
