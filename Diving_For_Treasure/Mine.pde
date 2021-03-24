
/**
 * This methods draws a mine in an empty cell.
 * @param float the x-position of the cell.
 * @param float the y-position of the cell.
 */
void drawMine(float xPos, float yPos) {
    
  // Draw empty cell.
  drawEmptyCell(xPos, yPos);

  // Draw image of mine in cell.
  PImage mineImage = loadImage("./Resources/mine512px.png");
  mineImage.resize((int)getEmptyCellWidth(), (int)getEmptyCellHeight());
  image(mineImage, xPos, yPos);
}
