/**
 * Menu Function (STATE_MENU)
 */

/**
 * Opens game menu.
 */
void openMenu()
{
  gameState = STATE_MENU;                 // checks state

  menuBG = loadImage("Menu0.png");        // assinging content to the variable

    rightKeyPressed = 0;                    // right key has been pressed zero times
}

/**
 * Subfunction for drawing the screen when in MENU state.
 */
void draw_Menu()
{
  background(menuBG);                                // draws background with the current value

  // skipping state text
  stroke(0);
  fill(random(150, 256));
  textSize(18);
  textAlign(CENTER);
  text("Press ENTER to Skip", width/2, height-15 );

  // adds the content listed below, if right key has been pressed 0 times
  if (rightKeyPressed == 0)
  {
    menuBG = loadImage("Menu0.png");
    stroke(0);
    fill(random(150, 256));
    textSize(18);
    textAlign(CORNERS);
    text("NEXT", width-120, height-15 );
  }

  // adds the content listed below, if right key has been pressed 1 times
  if (rightKeyPressed == 1)
  {
    menuBG = loadImage("Menu1.png");
    stroke(0);
    fill(random(150, 256));
    textSize(18);
    textAlign(CORNERS);
    text("NEXT", width-120, height-15 );

    stroke(0);
    fill(random(150, 256));
    textSize(18);
    textAlign(CORNER);
    text("BACK", 75, height-15 );
  }

  // adds the content listed below, if right key has been pressed 0 times
  if (rightKeyPressed == 2)
  {
    menuBG = loadImage ("Menu2.png");

    stroke(0);
    fill(random(150, 256));
    textSize(18);
    textAlign(CORNERS);
    text("NEXT", width-120, height-15 );

    stroke(0);
    fill(random(150, 256));
    textSize(18);
    textAlign(CORNER);
    text("BACK", 75, height-15 );
  }

  // adds the content listed below, if right key has been pressed 0 times
  if (rightKeyPressed == 3)
  {
    menuBG = loadImage("Menu3.png");

    stroke(0);
    fill(random(150, 256));
    textSize(18);
    textAlign(CORNER);
    text("BACK", 75, height-15 );
  }
}

/**
 * Subfunction for handling key presses when in MENU state.
 */
void keyPressed_Menu()
{
  // changes to GAME state and resets the variables, for next playthrough
  if ( keyCode == ENTER )
  {
    startGame();
    playerFrameIdx = 0;
    kills = 0;
  }

  // increase the values of 'rightKeyPressed'
  if (keyCode == RIGHT)
  {
    rightKeyPressed = rightKeyPressed + 1;

    if (rightKeyPressed > 3)
    {
      rightKeyPressed = 3;        // does not allow value to exceed 3
    }
  }

  // decrease the values of 'rightKeyPressed'
  if (keyCode == LEFT)
  {
    rightKeyPressed = rightKeyPressed - 1;

    if (rightKeyPressed < 0)
    {
      rightKeyPressed = 0;        // does not allow value to drop below 0
    }
  }
}

