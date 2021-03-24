
/**
 * This method drawns an oxygen tank in an empty cell.
 * @param float the x-position of the cell.
 * @param flaot the y-positon of the cell.
 */
void drawOxygenTank(float xPos, float yPos) {
  
  // Draw empty cell.
  drawEmptyCell(xPos, yPos);

  // Draw image of oxygentank in cell.
  PImage oxygenImage = loadImage("./Resources/oxygentank512px.png");
  oxygenImage.resize((int)getEmptyCellWidth(), (int)getEmptyCellHeight());
  image(oxygenImage, xPos, yPos);
  
}
