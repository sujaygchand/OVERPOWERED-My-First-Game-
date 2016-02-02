/**
 * Introduction Function (STATE_INTRO)
 */

/**
 * Begins the game.
 */
void beginGame()
{
  gameState = STATE_INTRO;       // checks state
}

/**
 * Subfunction for drawing the screen when in INTRO state.
 */
void draw_Intro()
{
  background(black);      // draws black background

  // First Line of game's title
  stroke(0);
  fill(white);
  textSize(50);
  textAlign(CENTER);
  text("OVERPOWERED:", width/2, height/8 );

  // second line of game's title
  textSize(40);
  text("SIMULATOR 2015 B.C.", width/2, 95 );

  // instuctional text
  textSize(30);
  text("Press ENTER to BEGIN", width/2, height*2/3 );
  text("Press T to OPEN my BLOG", width/2, height*4/5);

  // third line of game's title
  fill(random(256), random(256), random(256));
  textSize(25);
  text("Ultra Super Turbo Arcade Edition Version", width/2, 145);

  // author's text
  fill(155);
  textSize(20);
  textAlign(CORNER);
  text("CREATED BY: SUJAY GAURAV CHAND", 5, height-7);
}

/**
 * Subfunction for handling key presses when in INTRO state.
 */
void keyPressed_Intro() 
{
  // changes to MENU state
  if ( keyCode == ENTER )
  {
    openMenu();
  }

  // opens my blog
  if ( key == 't')
  {
    link("http://isthisprogress.tumblr.com");          
  }
}

