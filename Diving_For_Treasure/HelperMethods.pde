// This module contains helper methods that are used in more than one module.

/**
 * This method is a helper method to reduce code repetiton (Don't repeat yourself!).
 * @param String the text to show.
 * @param float the x-position of the text.
 * @param float the y-position of the text.
 * @param float the size of the font.
 * @param color the color of the text.
 */
void showText(String text, float xPos, float yPos, float textSize, color textColor) {
  textSize(textSize);
  fill(textColor);
  text(text, xPos, yPos);
}
