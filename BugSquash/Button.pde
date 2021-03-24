
void drawButton(float[] buttonDimensions, color buttonColor, String buttonText, color textColor) { // Contains x- and y-positions, width, height, button color and text color.
  
  final float TEXT_SIZE = buttonDimensions[3] * 0.5; // The size of the buttontext is always half the value of the button's height.
  
  fill(buttonColor);
  rect(buttonDimensions[0], buttonDimensions[1], buttonDimensions[2], buttonDimensions[3]);
  
  fill(textColor);
  textSize(TEXT_SIZE);
  text(buttonText, buttonDimensions[0] + buttonDimensions[2] / 2 - textWidth(buttonText) / 2, buttonDimensions[1] + TEXT_SIZE * 1.5); 
  
  
}

boolean isOverButton(float mouseXPos, float mouseYPos, float[] buttonDimensions) {
  
  return mouseXPos > buttonDimensions[0] && mouseXPos < buttonDimensions[0] + buttonDimensions[2] && mouseYPos > buttonDimensions[1] && mouseYPos < buttonDimensions[1] + buttonDimensions[3];
}
