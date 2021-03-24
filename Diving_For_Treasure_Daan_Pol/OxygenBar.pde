
long oxygenBarTimer = millis();

float reductionRate = 0.0;

/**
 * This method draws an oxygen bar.
 * @param float the x-position of the bar.
 * @param float the y-position of the bar.
 * @param float the width of the bar.
 * @param float the height of the bar.
 */
void drawOxygenBar(float xPos, float yPos, float barWidth, float barHeight) {
  
  // Define config and offset values.
  final color INNER_BAR_MOSTLY_FULL_COLOR = #0000FF;
  final color INNER_BAR_ALMOST_EMPTY_COLOR = #FF0000;
  final color OUTER_BAR_COLOR = #FFFFFF;
  final color OUTER_BAR_BORDER_COLOR = #000000;
  final int OUTER_BAR_BORDER_WIDTH = 1;

  // Draw outer bar.
  strokeWeight(OUTER_BAR_BORDER_WIDTH);
  stroke(OUTER_BAR_BORDER_COLOR);
  fill(OUTER_BAR_COLOR);
  rect(xPos, yPos, barWidth, barHeight);
   
  if (yPos + (barHeight * this. reductionRate) < yPos + barHeight) {
      // Adjust inner bar height by reduction rate.
      yPos += barHeight * this.reductionRate;
      barHeight -= barHeight * this.reductionRate;
      // Draw inner bar.
      fill(this.reductionRate >= 0.5 ? INNER_BAR_ALMOST_EMPTY_COLOR : INNER_BAR_MOSTLY_FULL_COLOR); // If oxygenbar is half empty change oxygen bar color to red.
      rect(xPos, yPos, barWidth, barHeight);
      
   }
 }

/**
 * This method increases the reduction rate.
 */
void reduceOxygenBar() {
  
  final int REDUCTION_INTERVAL = 1000;
  final float REDUCTION_RATE_INCREASE = 0.025;
  
  if (millis() - oxygenBarTimer > REDUCTION_INTERVAL) { 
    
    if (reductionRate < 1 && getPlayerRow() > 0) {
      reductionRate += REDUCTION_RATE_INCREASE;
    } else if (reductionRate >= 1) {
      resetPlayer();
    }
    
    oxygenBarTimer = millis();

  }
  
}
/**
 * This method returns the reduction rate.
 * @return the reduction rate.
 */
float getOxygenBarReductionRate() {
  
  return this.reductionRate;
}

/**
 * This method sets the reduction rate.
 * @param float a value.
 */
void setOxygenBarReductionRate(float rate) {
  
  this.reductionRate = rate;
}
