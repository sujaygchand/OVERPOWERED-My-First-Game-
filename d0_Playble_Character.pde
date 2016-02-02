/**
 * This tab contains the methods for the playable character
 *
 * This enitre tab uses Reference 1 and 7a.
 *
 */

// loads player in Idle
void loadIdleFrames()
{
  // reserve memory for images
  playerFrames = new PImage[1];

  //loadimages
  for ( int i = 0; i< playerFrames.length; i++)
  {
    // searches for files (in data folder) with "Standing" and a number extension unitl 1. 
    String filename = "Standing" + (i+1) + ".png";  
    playerFrames[i] = loadImage(filename);          // shows loaded frame
  }
}


// Animates player in Idle stance (with its single frame)
void animatePlayer()
{
  if ( frameCount % IDLE == 1)
  {
    playerFrameIdx++;
  }
}

// load player's left running frames
void loadLeftRunFrames()
{
  // reserve memory for images
  playerFrames = new PImage[6];

  // loadimages
  for ( int i = 0; i<playerFrames.length; i++)
  {
    // searches for files (in data folder) with "LeftRunning" and a number extension unitl 6
    String filename = "LeftRunning" + (i+1) + ".png";
    playerFrames[i] = loadImage(filename);              // shows loaded frame at that instance
  }
}

// animate player's left frames
void animatePlayerRunLeft()
{
  if ( frameCount % LEFT_RUN == 0)      // show frame 'div/0' + Remainder 
  {
    playerFrameIdx++;              // adds next frame if remainder exists
    if ( playerFrameIdx >= playerFrames.length ) 
    {
      // resets the player frame index if it exceeds 5 (look at prior method)
      playerFrameIdx = 0;
    }
  }
  playerPosX--; // move character position left
}

// load player's right running frames
void loadRightRunFrames()
{
  // reserve memory for images
  playerFrames = new PImage[6];
  // loadimages
  for ( int i = 0; i<playerFrames.length; i++)
  {
    // searches for files (in data folder) with "Running" and a number extension unitl 6
    String filename = "Running" + (i+1) + ".png";
    playerFrames[i] = loadImage(filename);            // shows loaded frame at that instance
  }
}

// animate player's right frames
void animatePlayerRunRight()
{
  if ( frameCount % RIGHT_RUN == 0)      // show frame 'div/0' + Remainder 
  {
    playerFrameIdx++;              // adds next frame if remainder exists
    if ( playerFrameIdx >= playerFrames.length ) 
    {
      // resets the player frame index if it exceeds 5 (look at prior method)
      playerFrameIdx = 0;
    }
  }
  playerPosX++; // move character position right
}

// draws player
void drawPlayer()
{
  imageMode(CORNER);
  // player is 87x79 pixels: offset - 40/-45 to place feet at playerPosX/playerPosY
  image(playerFrames[playerFrameIdx], playerPosX -40, playerPosY +45);

  // creates red dot above player, to keep track of his location when screen is overcrowded
  stroke(color(255, 0, 0));
  ellipse(playerPosX, playerPosY, 2, 2);
}

