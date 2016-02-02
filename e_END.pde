/**
 * Game Ending Function (STATE_END)
 */

/**
 * Ends the game(Playable Section).
 */
void endGame()
{
  gameState = STATE_END;
  gameActive = false;                // stops game from running in background

  // initialise the minim instance as 'sound' in this state
  sound = new Minim(this);

  // loads a sound sample into a variable 
  nextBattle = sound.loadSample("GET READY FOR THE NEXT BATTLE! - TEKKEN 5 OST.mp3"); // Reference 4f
}

/**
 * Subfunction for drawing the screen when in END state.
 */
void draw_End()
{
  background(125, 125, 0, 155);          // draws background with an aesthetically pleasing colour 

  // end game text
  stroke(0);
  fill(white);
  textSize(30);
  textAlign(CENTER);
  text("END OF LEVEL FOR THIS SIMULATION", width/2, height/5 );
  text("KILLS: " + kills, width/2, height*3/5 );
  fill(random(130, 256));
  text("PRESS ANY KEY FOR BOSS LEVEL", width/2, height*3/4 );
}

/**
 * Subfunction for handling key presses when in END state.
 */
void keyPressed_End()
{
  // changes to TROLL state
  beginTroll();
  
  // Pauses all background music
  player1.pause();
  player2.pause();
  player3.pause();
  player4.pause();

  // plays sound with a reduced gain
  nextBattle.setGain(-36);
  nextBattle.trigger();
}

