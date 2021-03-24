float caretWidth;

/**
 *This method draws a cursor (caret).
 *@param float the x-position of the caret.
 *@param float the y-position of the caret.
 */
void drawCaret(float xPos, float yPos) {
  
  final int CARET_THICKNESS = 4;
  
  strokeWeight(CARET_THICKNESS);
  line(xPos + this.caretWidth / 2, yPos, xPos + this.caretWidth, yPos); // A little offset is needed between the x-position of the textfield and the x-position of the caret, else letter like 'J' will be drawn partially outside of the textfield.
}

/**
 * This method sets the width of the caret.
 * @param float the width of the caret.
 */
void setCaretWidth(float caretWidth) {
  
  this.caretWidth = caretWidth;
}

/**
 * This method returns the width of the caret.
 * @return float the width of the caret.
 */
float getCaretWidth() {
  
  return this.caretWidth;
}
  
