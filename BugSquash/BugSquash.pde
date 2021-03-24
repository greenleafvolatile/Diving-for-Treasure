final int START = 0;
final int GAME = 1;
final int END = 2;


int screen = END;

void setup() {
  
  size(1000, 1000);
  setBugWidth(100);
  setGameScreenWidth(width);
  setGameScreenHeight(height);
  
}

void draw() {
  
  clear();
  smooth();
  if (screen == START) {
    drawStartScreen(width, height); 
    
  } else if (screen == GAME) {
    drawGameScreen();
    if (isTimeup() && getLevel() < 3) {
      levelUp();
    } else if (isTimeup()) {
      this.screen = END;
    }
  } else if (screen == END) {
    drawEndScreen(width, height);
  }
}

void mousePressed() {
   
  final float MOUSE_X = mouseX;
  final float MOUSE_Y = mouseY;
  
  if (screen == GAME) {
    
   // Check if mouse event occured on bug.
   for (int i = 0; i < getBugData().length; i++) {
     final float BUG_X = getBugData()[i][0];
     final float BUG_Y = getBugData()[i][1];
     
     if (isOverBug(MOUSE_X, MOUSE_Y, BUG_X, BUG_Y)) {
       initBug(bugData[i]); // Same old bug with new position values.
       setScore(getScore() + 1);
     }
   }
   
  } else if (screen == START) {
     if (isOverButton(MOUSE_X, MOUSE_Y, getStartButtonData()))  {
       setBugSpeed(getSpeedSetting());
       initBugs();

       this.screen = GAME;
       startGameTimer();
     } else if (get((int)MOUSE_X, (int)MOUSE_Y) == getUpArrowButtonColor()) {
       setSpeedSetting(getSpeedSetting() + 1);
     } else if (get((int)MOUSE_X, (int)MOUSE_Y) == getDownArrowButtonColor()) {
       setSpeedSetting(getSpeedSetting() - 1);
     }
  }
}

    
  
  
