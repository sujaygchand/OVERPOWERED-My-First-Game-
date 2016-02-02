/**
 * Trolling Function (STATE_TROLL)
 */

/**
 * Begins the trolling section.
 */
void beginTroll() 
{
  gameState = STATE_TROLL;

  Troll = loadImage("Troll.png");                // Reference 5a
}

/**
 * Subfunction for drawing the screen when in TROLL state.
 */
void draw_Troll()
{
  // background is tranparent, so the image is drawn directly above the previous state
  noFill();                               
  imageMode(CENTER);
  image(Troll, width/2, height/2, 500, 400);
}

/**
 * Subfunction for handling key presses when in TROLL state.
 */
void keyPressed_Troll()
{
  link("https://www.youtube.com/watch?v=pzDgaGTARqE");    // opens link to a video (Reference 7b)
  beginGame();                                            // goes back to INTRO state
}

