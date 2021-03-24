
/**
 * This method draw a diamond in an empty cell.
 * @param float x-position of the cell.
 * @param float y-position of the cell.
 */
void drawDiamond(float xPos, float yPos) {
  
  // Draw empty cell.
  drawEmptyCell(xPos, yPos);

  // Draw image of diamond in cell.
  PImage diamondImage = loadImage("./Resources/diamond512px.png");
  diamondImage.resize((int)getEmptyCellWidth(), (int)getEmptyCellHeight());
  image(diamondImage, xPos, yPos);
 
}
