
String[][] highscores = new String[10][2];

/**
 * this method adds a player's name and score to the higscores list (if eligible).
 * @param String[] containing the player's name and score.
 */
void addToHighscores(String[] score) {
  
  int index = findIndexToInsertScore(score);
  addScore(index, score);
}
  
/**
 * This methods determines where to insert the player's name and score in the highscores list.
 * @param String[] the player's name and score.
 * @return int the index at which to insert the player's name and score.
 */
int findIndexToInsertScore(String[] score) {
  
    int index = 0;
    
    for (int i = 0; i < highscores.length; i++) {
      if (Integer.parseInt(score[1]) > Integer.parseInt(highscores[i][1])) {
        index = i;
        break;
      }
    }
    return index;
}

/**
 * This method adds the player's name and score to the highscores list and moves all subsequent name's and score's down by 1 index.
 * @param int the index at which to insert the player's name and score.
 * @param String[] the player's name and score.
 */
void addScore(int index, String[] score) { // I had some trouble with this algorithm. I turned to SO and found a solution at: https://stackoverflow.com/questions/11638123/how-to-add-an-element-to-array-and-shift-indexes

  String[] prevValue = score;
  for (int i = index; i < highscores.length; i++) {
    String[] tmp = prevValue;
    prevValue = highscores[i];
    highscores[i] = tmp;
  }
}

/**
 * This method loads the highscore values from the highscores.text file into the highscores array.
 */
void loadHighscores() {
  
  String[] contentOfHighscoresFile = loadStrings("highscores.txt");
  for (int i = 0; i < contentOfHighscoresFile.length; i++) {
    String[] line = split(contentOfHighscoresFile[i], " ");
    String name = line[0];
    String score = line[1];
    highscores[i][0] = name;
    highscores[i][1] = score;
   }
}

/** 
 * This method save the values in the highscores array to a file (highscores.txt).
 */
void saveHighscores() {
  
  PrintWriter out = createWriter("highscores.txt");
  for (int i = 0; i < highscores.length; i++) {
    String line = highscores[i][0] + " " + highscores[i][1];
    out.println(line);
  }
  out.flush();
  out.close();
}

/**
 * This method return the highscores list.
 * @return String[][] the list of highscores.
 */
String[][] getHighscores() {
  
  return this.highscores;
}

/**
 * This method determines whether the player's score is eligible to go on the highscores list.
 * @return boolean true if eligible, else false.
 */
boolean isHighscore(String[] score) {
  
  for (int i = 0; i < highscores.length; i++) {
      if (Integer.parseInt(score[1]) > Integer.parseInt(highscores[i][1])) {
        return true;
      }
    }
    return false;
}
