import java.util.Arrays;


// Testcase 1 Module HighScores, methode int findIndexToInsertScore(String[] score)

void testFindIndexToInsertScore() {
  
  // Empty the highscores array.
  for (String[] array : highscores) {
    Arrays.fill(array, null);
  }
  
  // Fill the highscores array with testdata.
  highscores[0][0] = "Daan";
  highscores[0][1] = "100";
  highscores[1][0] = "Henk";
  highscores[1][1] = "50";
  
  // Define new scores.
  String[] score1 = {"Ronald", "75"};
  String[] score2 = {"Ronald", "200"};
  
  // Define expected output.
  int expectedOutput1 = 1;
  int expectedOutput2 = 0;
  
  print("Testcase 1/1: findIndexToInsertString:");
  if (findIndexToInsertScore(score1) == expectedOutput1) {
    println("Passed");
  }else {
     println("Failed");
  }
  
  print("Testcase 1/2: findIndexToInsertString:");
  if (findIndexToInsertScore(score2) == expectedOutput2) {
    println("Passed");
  }else {
    println("Failed");
  }
}


// Testcase 2 Module HighScores, methode addToHighscores(String[] score)

void testAddToHighscores() {
   
  //Empty the highscores array.
  for (String[] array : highscores) {
    Arrays.fill(array, null);
  }
  
  // Fill the highscores array with testdata.
  highscores[0][0] = "Daan";
  highscores[0][1] = "100";
  highscores[1][0] = "Henk";
  highscores[1][1] = "50";
  
  // Define new scores.
  String[] score1 = {"Ronald", "75"};
  
  // If Ronald's score appears as second place, and Henk's score is now the 3rd place score, test passed.
  addToHighscores(score1);
  
  print("Testcase 2: addToHighscores:");
  if (highscores[1][0].equals("Ronald") && highscores[1][1].equals("75") && highscores[2][0].equals("Henk") && highscores[2][1].equals("50")) {
    println("Passed");
  } else {
    println("Failed");
  }
}

// Testcase 3 Module Player, methode calculatePickedupTreasureValue().

void testCalculatePickedupTreasureValue() {
  
  // Fill the pickedup treasure array with 3 coins and 2 diamants.
  TREASURES_PICKED_UP[0] = 3;
  TREASURES_PICKED_UP[1] = 2;
  
  // Define expected output
  int expectedOutput = 350;
  
  print("Testcase 3: calculatePickedupTreasureValue");
  if (calculatePickedupTreasureValue() == expectedOutput) {
    println("Passed");
  } else {
    println("Failed");
  }
}
