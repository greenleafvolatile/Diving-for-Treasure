final float[] START_BUTTON_DATA = new float[4];
final int DEFAULT_SPEED_SETTING = 1;
int speedSetting = DEFAULT_SPEED_SETTING;

void drawStartScreen(float screenWidth, float screenHeight) {
  
  // Define general config and offset.
  final color SCREEN_COLOR = #FFFFFF;
  final color TEXT_COLOR = #000000;
  final float TEXT_SIZE = screenHeight / 10;
  final float V_PADDING = screenHeight / 30;
  
  // Define start button config.
  final String START_BUTTON_TEXT = "START";
  final color START_BUTTON_COLOR = #FFFF00;
  final color START_BUTTON_TEXT_COLOR = #000000;
  
  background(SCREEN_COLOR);
  fill(TEXT_COLOR);
  textSize(TEXT_SIZE);
  
  final String ARROW_BUTTONS_FUNCTION_TEXT = "SPEED: ";
  text(ARROW_BUTTONS_FUNCTION_TEXT, screenWidth / 2 - textWidth(ARROW_BUTTONS_FUNCTION_TEXT) / 2, screenHeight / 4);
  
  drawUpArrowButton(screenWidth / 2 + textWidth(ARROW_BUTTONS_FUNCTION_TEXT) / 2, screenHeight / 4 - TEXT_SIZE, TEXT_SIZE, upArrowButtonColor);
  
  final String SPEED = String.valueOf(speedSetting);
  text(SPEED, screenWidth / 2 + textWidth(ARROW_BUTTONS_FUNCTION_TEXT) / 2 + TEXT_SIZE / 2 - textWidth(SPEED) / 2, screenHeight / 4); 
  
  drawDownArrowButton(screenWidth / 2 + textWidth(ARROW_BUTTONS_FUNCTION_TEXT) / 2, screenHeight / 4 + V_PADDING, TEXT_SIZE, downArrowButtonColor);
  
  //START_BUTTON_DATA[2] = screenWidth / 3;
  //START_BUTTON_DATA[3] = screenHeight / 10;
  START_BUTTON_DATA[0] = screenWidth / 2 - START_BUTTON_DATA[2] / 2;
  START_BUTTON_DATA[1] = screenHeight - START_BUTTON_DATA[3];
  drawButton(START_BUTTON_DATA, START_BUTTON_COLOR, START_BUTTON_TEXT, START_BUTTON_TEXT_COLOR);
  
}

float[] getStartButtonData() {
  return this.START_BUTTON_DATA;
}

int getSpeedSetting() {
  return this.speedSetting;
}

void setSpeedSetting(int setting) {
  this.speedSetting = constrain(setting, 1, 5);
}
