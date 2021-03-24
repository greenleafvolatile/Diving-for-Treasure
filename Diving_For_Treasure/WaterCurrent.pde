long currentTimer;

/**
 * This method applies a water current moving the player one cell width to the right every x seconds (x being equal to CURRENT_INTERVAL)
 */
void applyCurrent() {
  final long CURRENT_INTERVAL = 3000;
  
  if(millis() - currentTimer > CURRENT_INTERVAL && (getPlayerRow() > 0 && getPlayerRow() < getNumberOfRows() - 1)){
    movePlayer("RIGHT");
    currentTimer = millis();
  }
}

/**
 * This method starts the water current timer.
 */
void startWaterCurrentTimer() {
  
  this.currentTimer = millis();
  
}
