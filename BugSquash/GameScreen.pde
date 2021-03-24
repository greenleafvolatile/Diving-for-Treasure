final int NUMBER_OF_BUGS  = 2;

int level = 0;
int score = 0;

float gameScreenWidth;
float gameScreenHeight;

float[][] bugData = new float[NUMBER_OF_BUGS][3]; // xPos, yPos and initial speed.

long gameTimer;

boolean running;
boolean timeup;

void drawGameScreen() {
  
  final color TEXT_COLOR = #FFFFFF;
  
  float textSize = this.gameScreenHeight / 20;
  textSize(textSize);
  fill(TEXT_COLOR);
  
  // Show level text.
  String levelText = "Level: " + level;
  text(levelText, 0, textSize); 
  
  // Show score.
  text("score: " + score, textWidth(levelText + " "), textSize);
  
  for (int i = 0; i < bugData.length; i++) {
    drawBug(bugData[i][0], bugData[i][1]);
  }
  drawBugs();
  moveBugs();
}

void levelUp() {
  
  if (this.level < 3) {
    this.level++;
  }
  increaseBugSpeed();
  resetGameTimer();
}

void resetGameTimer() {
  this.gameTimer = millis();
}

void startGameTimer() {
  this.gameTimer = millis();
  this.running = true;
}

void initBugs() {
  
  for(int i = 0; i < bugData.length; i++) {
    initBug(bugData[i]);
  }
   
}

void drawBugs() {
  
  for (int i = 0; i < bugData.length; i++) {
    final float BUG_X = bugData[i][0];
    final float BUG_Y = bugData[i][1];
    drawBug(BUG_X, BUG_Y);
  }
}

void moveBugs() {
  
  for(int i = 0; i < bugData.length; i++) {
    bugData[i][0] += bugData[i][2];
    if(isAtEdgeOfScreen(bugData[i])) {
      changeDirection(bugData[i]);
    }
  }
    
}

void changeDirection(float[] bugData) {
  
  if (bugData[0] <= 0) {
      bugData[2] = bugData[2] * -1;
  } else if(bugData[0] + getBugWidth() >= this.gameScreenWidth) {
      bugData[2] = -bugData[2];
  }
}


boolean isAtEdgeOfScreen(float[] bugData) {
  
  if (bugData[0] <= 0) {
    return true;
  } else if(bugData[0] + getBugWidth() >= this.gameScreenWidth) {
    return true;
  }
  return false;
}

void setGameScreenHeight(float screenHeight) {
  this.gameScreenHeight = screenHeight;
}

void setGameScreenWidth(float screenWidth) {
  this.gameScreenWidth = screenWidth;
}

float[][] getBugData() {
  return this.bugData;
}

int getScore() {
  return this.score;
}

int getLevel() {
  return this.level;
}

void setScore(int score) {
  this.score = score;
}

void setLevel(int level) {
  this.level = level;
}

void setscore(int score) {
  this.score = score;
}

long getGameTimer() {
  return this.gameTimer;
}

boolean isRunning() {
  return this.running;
}

boolean isTimeup() {
  return millis() - this.gameTimer >= 5000;
}
 
