float buttonWidth;

/**
 * This method draws a bar (an array) of buttons with text.
 * @param float the x-position of the bar.
 * @param float the y-position of the bar.
 * @param float[][] an array in which to store the x-position, y-position and value of a button.
 * @param int the type of object this bar represents.
 * @param float the padding (offset) between the buttons.
 * eparam float the size of the text on the buttons.
 */
void drawButtonBar(float xPos, float yPos, float[][] array, int objectType, float hPadding, float textSize) {
  
  final color SELECTED_BUTTON_COLOR = #00FF00;
  final color UNSELECTED_BUTTON_COLOR = #FFFFFF;
  final color TEXT_COLOR = #000000;
  
  textSize(textSize);
  
  // Store button data in array.
  for (int i = 0; i < BUTTON_VALUES.length; i++) {

    array[i][0] = xPos;
    array[i][1] = yPos;
    array[i][2] = buttonWidth;
    array[i][3] = buttonWidth;
    array[i][4] = BUTTON_VALUES[i];
    
    final String TEXT = String.valueOf(BUTTON_VALUES[i]);
    boolean selected = false;
    
    // If number on button is equal to currently selected number of object in game, set to selected.
    if (array[i][4] == getNumberOfObjects(objectType)) {
      selected = true;
    }
    
    final color BUTTON_COLOR = selected ? SELECTED_BUTTON_COLOR : UNSELECTED_BUTTON_COLOR;
    
    // Draw the button.
    drawButton(array[i], TEXT, BUTTON_COLOR, TEXT_COLOR);
   
    xPos += buttonWidth + hPadding;
    
  }
}

/**
 * This method sets the individual button width.
 * @param float the with of the button.
 */
void setButtonWidth(float buttonWidth) {
  
  this.buttonWidth = buttonWidth;
}

/**
 * This method returns the width of an individual button.
 * @return float the width of an invidivdual button.
 */
float getButtonWidth() {
  
  return this.buttonWidth;
}

boolean isOverButtonBar(float[][] array, float mouseXPos, float mouseYPos) {
  
  for (int i = 0; i < array.length; i++) {
    float buttonXPos = array[i][0];
    float buttonYPos = array[i][1];
     if (mouseXPos >= buttonXPos && mouseXPos <= buttonXPos + buttonWidth && mouseYPos >= buttonYPos && mouseYPos <= buttonYPos + buttonWidth) {
       return true;
     }
  }
  return false;
}
