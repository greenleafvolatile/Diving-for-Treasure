// N.b. I got the idea for the implementation of the blinking caret from: https://forum.processing.org/two/discussion/11790/does-anybody-know-how-to-create-a-blinking-cursor

boolean blink = true; 

float textfieldXPos, textfieldYPos, textfieldWidth, textfieldHeight, textfieldTextSize; 

long blinkTimer = millis(); 

/**
 * This method draws the textfield. This method perhaps does too much: it draws the textfield, the text inside the textfield, and the blinking cursor. Next time try to implement methods that only do one thing.
 */
void drawTextfield() {

  // Define config values.
  final int TEXTFIELD_BORDER_RADIUS = 7;
  final long BLINK_INTERVAL = 500;
  final color TEXTFIELD_BORDER_COLOR = #000000;
  final color TEXTFIELD_COLOR = #0000FF;
  final color TEXT_COLOR = #000000;
  
  // Draw the textfield.
  stroke(TEXTFIELD_BORDER_COLOR);
  fill(TEXTFIELD_COLOR);
  rect(this.textfieldXPos, this.textfieldYPos, this.textfieldWidth, this.textfieldHeight, TEXTFIELD_BORDER_RADIUS);
  
  // Draw the blinking caret.
  this.textfieldTextSize =this.textfieldHeight * .8; // Set textsize to 8/10ths of the height of the textfield.
  textSize(this.textfieldTextSize); 

  final float CARET_XPOS = this.textfieldXPos + textWidth(getPlayerName()); // Must be after call to textSize();
  final float CARET_YPOS = this.textfieldYPos + this.textfieldHeight - this.textfieldHeight / 10;
  
  setCaretWidth(textWidth("m")); // I read somewhere (no source) that 'm' is often the widest char.
  if (blink) {
    drawCaret(CARET_XPOS, CARET_YPOS);
    blink = !blink;
  }
  
  if (millis() - blinkTimer >= BLINK_INTERVAL) {
    blink = !blink;
    blinkTimer = millis();
  }

  // Draw the text inside the field.
  fill(TEXT_COLOR); 
  text(getPlayerName(), this.textfieldXPos + getCaretWidth() / 2, this.textfieldYPos + this.textfieldHeight - this.textfieldHeight * .2); 

}

/**
 * This method sets the textfield's width.
 * @param float the width of the textfield.
 */
void setTextfieldWidth(float textfieldWidth) {
  
  this.textfieldWidth = textfieldWidth;
}

/** 
 * This method sets the textField's height.
 * @param float the height of the textfield.
 */
void setTextfieldHeight(float textfieldHeight) {
  
  this.textfieldHeight = textfieldHeight;
}

/**
 * This method sets the textfield's x-position.
 * @param float the x-position of the textfield.
 */
void setTextfieldXPos(float xPos) {
  
  this.textfieldXPos = xPos;
}

/**
 * This method sets the textfield's y-position.
 * @param float the y-position of the textfield.
 */
void setTextfieldYPos(float yPos) {
  
  this.textfieldYPos = yPos;
}

/**
 * This method returns the textfield's textsize.
 * @return float the textsize.
 */
float getTextfieldTextSize() {
  
  return this.textfieldTextSize;
}

/**
 * This method returns the textfield's height.
 * @return float the height of the textfield.
 */
float getTextfieldHeight() {
  
  return this.textfieldHeight;
}

/**
 * This method returns the textfield's width.
 * @return the width of the textfield.
 */
float getTextfieldWidth() {
  
  return this.textfieldWidth;
}
