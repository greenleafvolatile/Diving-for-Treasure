color downArrowButtonColor = #00FF00;

void drawDownArrowButton(float xPos, float yPos, float sideLength, color buttonColor) {
  
  fill(buttonColor);
  triangle(xPos, yPos, xPos + sideLength / 2, yPos + sideLength, xPos + sideLength, yPos);
}

color getDownArrowButtonColor() {
  return this.downArrowButtonColor;
}
