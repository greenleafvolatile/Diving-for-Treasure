float bugWidth;
int bugSpeed = 3; 

void drawBug(float xPos, float yPos) {
  
  PImage bugImage = loadImage("ladybug512px.png");
  image(bugImage, xPos, yPos, bugWidth, bugWidth);
  
}

void setBugWidth(float bugWidth) {
  this.bugWidth = bugWidth;
}

void setBugSpeed(int speed) {
  this.bugSpeed = speed;
}

float getBugWidth() {
  return this.bugWidth;
}

boolean isOverBug(float mouseXPos, float mouseYPos, float bugXPos, float bugYPos) {
  
  return mouseXPos >= bugXPos && mouseXPos <= bugXPos + this.bugWidth && mouseYPos >= bugYPos && mouseYPos <= bugYPos + bugWidth;
  
}

void initBug(float[] bugData) {
  
  for (int i = 0; i < bugData.length; i++) {
    
    // Initialize bug xPos and yPos
    float xPos = random(this.gameScreenWidth - getBugWidth());
    float yPos = random(this.gameScreenHeight - getBugWidth());
    bugData[0] = xPos;
    bugData[1] = yPos;
    
    // Initialize speed / movement direction. If closer to left border to left border else to right border.
    if (this.gameScreenWidth - xPos < xPos) {
      bugData[2] = bugSpeed;
    } else { 
      bugData[2] = -bugSpeed;
    }
  }
}
  

void increaseBugSpeed() {
  
  this.bugSpeed++; // So that newly created bugs have the new speed

  
  // Adjust the speed of bugs currently in play.
  for (int i = 0; i < bugData.length; i++) {
    if (bugData[i][2] > 0) {
      bugData[i][2] += bugSpeed;
    } else {
      bugData[i][2] -= bugSpeed;
    }
  }
}
  
  
