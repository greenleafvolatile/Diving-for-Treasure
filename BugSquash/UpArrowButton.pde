color upArrowButtonColor = #FF0000;

void drawUpArrowButton(float xPos, float yPos, float sideLength, color buttonColor) {
  
  fill(buttonColor);
  triangle(xPos, yPos, xPos + sideLength / 2, yPos - sideLength, xPos + sideLength, yPos);
}

color getUpArrowButtonColor() {
  return this.upArrowButtonColor;
}
