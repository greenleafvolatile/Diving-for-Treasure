final int[] BUTTON_VALUES = {5, 10, 15, 20, 25};

final float[][] HAZARDS_BUTTON_BAR_DATA = new float[BUTTON_VALUES.length][5]; // These values need to be global because they are queried in the ButtonBar module.
final float[][] TREASURES_BUTTON_BAR_DATA = new float[BUTTON_VALUES.length][5];
final float[] START_BUTTON_DATA = new float[4]; // xpos, ypos, width, height, border radius.

/**
 * This methods draws the settings screen where a player can enter his / her name and set the number of hazards(mines) and treasures(coins and diamonds) in the game.
 */
void drawSettingsScreen(float screenWidth, float screenHeight) {
  
  // Define general config and offset values.
  final color SETTINGS_SCREEN_TEXT_COLOR = #000000;
  final color SETTINGS_SCREEN_COLOR = #FFFFFF;
  final float MARGIN = screenWidth / 12; 
  final float H_PADDING = screenWidth / 50;
  final float V_PADDING = screenHeight / 40;
  final float SETTINGS_SCREEN_TEXT_SIZE = screenHeight / 20; 
  
  // Define config and offset values for the 'Settings' text.
  final String SETTINGS_TEXT = "Settings";
  final float SETTINGS_TEXTSIZE = screenHeight / 15;
  final color SETTINGS_TEXTCOLOR = #FF0000;
  
  // Define config and offset values for the hazards button bar.
  setButtonWidth((screenWidth - MARGIN  * 4) / BUTTON_VALUES.length); 
  final String MINES_BUTTON_BAR_TEXT = "Number Of Mines"; 
  final float BUTTON_BAR_TEXT_SIZE = screenHeight / 20;
   
  // Define config and offset values for the treasures button bar.
  final String TREASURES_BUTTON_BAR_TEXT = "Number Of Treasures";
  
  // Define config and offset values for the textfield.
  final String TEXT_FIELD_TEXT = "Player name:";
  
  // Define config values for the start button.
  final color START_BUTTON_COLOR = #FF0000;
  final color START_BUTTON_TEXT_COLOR = #000000;
  final String START_BUTTON_TEXT = "START";
  
  textSize(SETTINGS_SCREEN_TEXT_SIZE);
  background(SETTINGS_SCREEN_COLOR);
  
  
  // Show settings text.
  showText(SETTINGS_TEXT, MARGIN, MARGIN + SETTINGS_SCREEN_TEXT_SIZE, SETTINGS_TEXTSIZE, SETTINGS_TEXTCOLOR);
  
  // Show hazards button bar text.
  showText(MINES_BUTTON_BAR_TEXT, MARGIN, MARGIN + V_PADDING * 2 + SETTINGS_SCREEN_TEXT_SIZE * 2, SETTINGS_SCREEN_TEXT_SIZE, SETTINGS_SCREEN_TEXT_COLOR);
  
  // Draw buttonbar for number of hazards.
  drawButtonBar(MARGIN, MARGIN + V_PADDING * 3 + SETTINGS_SCREEN_TEXT_SIZE * 2, this.HAZARDS_BUTTON_BAR_DATA, HAZARD, H_PADDING, BUTTON_BAR_TEXT_SIZE);
  
  // Show treasuers button bar text.
  showText(TREASURES_BUTTON_BAR_TEXT, MARGIN, MARGIN + V_PADDING * 4 + SETTINGS_SCREEN_TEXT_SIZE * 3 +  getButtonWidth(), SETTINGS_SCREEN_TEXT_SIZE, SETTINGS_SCREEN_TEXT_COLOR);
  
  // Draw buttonbar for number of treasures.
  drawButtonBar(MARGIN, MARGIN + V_PADDING * 5 + SETTINGS_SCREEN_TEXT_SIZE * 3 + getButtonWidth(), this.TREASURES_BUTTON_BAR_DATA, TREASURE, H_PADDING, BUTTON_BAR_TEXT_SIZE);
 
  // Show textfield text.
  showText(TEXT_FIELD_TEXT, MARGIN, MARGIN + V_PADDING * 6 + SETTINGS_SCREEN_TEXT_SIZE * 4 + getButtonWidth() * 2, SETTINGS_SCREEN_TEXT_SIZE, SETTINGS_SCREEN_TEXT_COLOR);
  
  // Initialize and draw TextField.
  setTextfieldWidth(buttonWidth * 2 + H_PADDING);  
  setTextfieldHeight(SETTINGS_SCREEN_TEXT_SIZE * 1.5);
  setTextfieldXPos(MARGIN);
  setTextfieldYPos(MARGIN + V_PADDING * 7 + SETTINGS_SCREEN_TEXT_SIZE * 4 + getButtonWidth() * 2);
  drawTextfield();
  
  // Initialize and draw StartButton.
  START_BUTTON_DATA[0] = MARGIN + getButtonWidth() + H_PADDING;
  START_BUTTON_DATA[1] = MARGIN + V_PADDING * 8 + SETTINGS_SCREEN_TEXT_SIZE * 4 + getButtonWidth() * 2 + getTextfieldHeight();
  START_BUTTON_DATA[2] = getButtonWidth() * 3 + H_PADDING * 2;
  START_BUTTON_DATA[3] = screenHeight - START_BUTTON_DATA[1] - V_PADDING;
  drawButton(START_BUTTON_DATA, START_BUTTON_TEXT, START_BUTTON_COLOR, START_BUTTON_TEXT_COLOR);

}



/**
 * This method returns the HAZARDS_BUTTON_BAR_DATA array.
 * @return float[][] the HAZARDS_BUTTON_BAR_DATA array.
 */
float[][] getHazardsButtonBarData() {
  
  return this.HAZARDS_BUTTON_BAR_DATA;
}

/** 
 * This method returns the TREASURES_BUTTON_BAR_DATA array.]
 * @float float[][] the TREASURES_BUTTON_BAR_DATA array.
 */
float[][] getTreasuresButtonBarData() {
  
  return this.TREASURES_BUTTON_BAR_DATA;
}

/**
 * This method returns the startbutton data (x-position, y-position, width and height).
 * @return float[] startbutton data.
 */
float[] getStartButtonData() {
  
  return this.START_BUTTON_DATA;
}
