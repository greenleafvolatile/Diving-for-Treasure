/**
 * This method draws a sun on the dashboad.
 * @param float the width of the dashboard.
 * @param float the height of the dashboard.
 */
void drawSun(float dashboardWidth, float dashboardHeight) {
  
  PImage sunImage = loadImage("sun512px.png");
  float sunImageWidth = (dashboardWidth / 2) / 10;
  float sunImageXPos = (dashboardWidth / 2) - sunImageWidth / 2;
  float sunImageYPos = dashboardHeight / 2 - sunImageWidth / 2;
  image(sunImage, sunImageXPos, sunImageYPos, sunImageWidth, sunImageWidth);
}
