/**
 * This method draws a button.
 * @param float[] the button's x-position, y-position, width, and height.
 * @param String the button's text.
 * @param buttonColor the button's color.
 * @param textColor the button's text color.
 */
 void drawButton(float[] buttonData, String buttonText, color buttonColor, color textColor) {
  
  // Define config and offset values.
  final int BORDER_RADIUS = 7;
  
  // Draw the button.
  fill(buttonColor);
  rect(buttonData[0], buttonData[1], buttonData[2], buttonData[3], BORDER_RADIUS);
  
  // Draw the text inside the button.
  textSize(buttonData[3] / 2);
  fill(textColor);
  text(buttonText, buttonData[0] + buttonData[2] / 2 - textWidth(buttonText) / 2, buttonData[1] + (buttonData[3] / 2) * 1.5); // + PADDING);
  
  
}
/**
 * This method determines whether a mouse evevnt occured over a button.
 * @param float[] the button's x-position, y-position, witdh, and height.
 * @param float the mouse's x-position.
 * @param float the mouse's y-position.
 */
boolean isOverButton(float[] buttonData, float mouseXPos, float mouseYPos) {
  
  return mouseXPos > buttonData[0] && mouseXPos < buttonData[0] + buttonData[2] && mouseYPos > buttonData[1] && mouseYPos < buttonData[1] + buttonData[3];
}
