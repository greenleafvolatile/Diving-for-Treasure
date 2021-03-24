/**
 * This method draws a boat on the dashboard.
 */
void drawBoat() {
  
  float xPos = getEmptyCellWidth() * getInitialPlayerColumn();
  float yPos = getDashboardHeight() - getEmptyCellHeight() * 2;
  PImage boatImage = loadImage("./Resources/coloredBoat512px.png");
  boatImage.resize((int)getEmptyCellWidth() * 2, (int)getEmptyCellHeight() * 2);
  image(boatImage, xPos, yPos);
}
