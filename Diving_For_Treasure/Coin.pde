
/**
 * This method draws a coin in an emtpy cell.
 * @param, the x-position of the cell.
 * @param, the y-position of the cell.
 */
void drawCoin(float xPos, float yPos) {
  
  // Draw empty cell.
  drawEmptyCell(xPos, yPos);
  
  // Draw image of coin in cell.
  PImage coinImage = loadImage("coin512px.png");
  coinImage.resize((int)getEmptyCellWidth(), (int)getEmptyCellHeight());
  image(coinImage, xPos, yPos);
  
}
