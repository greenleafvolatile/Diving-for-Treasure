float emptyCellWidth, emptyCellHeight;

/**
 * This method draws an empty cell in the grid (i.e. not filled with either a player, a hazard or an aid).
 */
void drawEmptyCell(float xPos, float yPos) {
  
  final int BACKGROUND_COLOR = #3EE3F1;
  fill(BACKGROUND_COLOR);
  rect(xPos, yPos, this.emptyCellWidth, this.emptyCellHeight);
}

/**
 * This method sets the cell's width.
 * @param float width value.
 */
void setEmptyCellWidth(float cellWidth) {
  
  this.emptyCellWidth = cellWidth;
}

/**
 * This method sets the cell's height.
 * @param float height value.
 */
void setEmptyCellHeight(float cellHeight) {
  
  this.emptyCellHeight = cellHeight;
}

/**
 * This method returns the cell's height.
 * @return float the height of the cell.
 */
float getEmptyCellHeight() {
  
  return this.emptyCellHeight;
}

float getEmptyCellWidth() {
  
  return this.emptyCellWidth;
}
  
