float[] AGAIN_BUTTON_DATA = new float[4];
float[] QUIT_BUTTON_DATA = new float[4];


void drawEndScreen(float screenWidth, float screenHeight) {
  
  // Define general config values.
  final color TEXT_COLOR = #FF0000;
  final float TEXT_SIZE = screenHeight / 8;
  final float vPadding = screenHeight / 20;
  
  //Define button config values.
  float buttonWidth = screenWidth / 4;
  float buttonHeight = screenHeight / 10;
  color buttonTextColor = #000000;
  
  String againButtonText = "AGAIN!";
  color againButtonColor = #00FF00;
  
  String quitButtonText = "QUIT!";
  color quitButtonColor = #0000FF;
  
  // Show endscore text
  String scoreText = "Your score: " + getScore();
  textSize(TEXT_SIZE);
  fill(TEXT_COLOR);
  text(scoreText, screenWidth / 2 - textWidth(scoreText) / 2, screenHeight / 2 - TEXT_SIZE / 2);
  
  // Initialize and draw play-again button.
  AGAIN_BUTTON_DATA[0] = screenWidth / 2 - buttonWidth / 2;
  AGAIN_BUTTON_DATA[1] = screenHeight / 2;
  AGAIN_BUTTON_DATA[2] = buttonWidth;
  AGAIN_BUTTON_DATA[3] = buttonHeight;
  drawButton(AGAIN_BUTTON_DATA, againButtonColor, againButtonText, buttonTextColor);

  // Initialize and draw quit button.
  QUIT_BUTTON_DATA[0] = screenWidth / 2 - buttonWidth / 2;
  QUIT_BUTTON_DATA[1] = screenHeight / 2 + buttonHeight + vPadding;
  QUIT_BUTTON_DATA[2] = buttonWidth;
  QUIT_BUTTON_DATA[3] = buttonHeight;
  drawButton(QUIT_BUTTON_DATA, quitButtonColor, quitButtonText, buttonTextColor);
  
  
 
}
