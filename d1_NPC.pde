/**
 * Class for NPC
 * 
 * This enitre tab uses Reference 2 and 7a.
 *
 */
class NPC
{
  // Properties of the NPC
  PImage[]     NPCFrames;          // NPC's current frame
  int          NPCFrameIdx;        // NPC's index frame 
  float        NPCPosX, NPCPosY;   // NPC's x and y coordinate
  boolean      MoveRight;          // checks if NPC is moving right

  /**
   * Constructor for a NPC instance.
   */
  NPC( boolean isMoveRight) {
    NPCPosY =  height/2;          // places NPC at its y coordinate
    MoveRight = isMoveRight;      // moving right
    NPCFrames = new PImage[8];    // reserves memory for images
    killed = false;               // NPC has not been killed.......yet

    // values if constructor is true 
    if (isMoveRight == true)
    {
      NPCPosX = 0;              // NPC's x coordinate

      for ( int i = 0; i< NPCFrames.length; i++)
      {
        // searches for files (in data folder) with "Running" and a number extension unitl 8
        String filename = "EnemyRunningRight" + (i+1) + ".png";
        NPCFrames[i] = loadImage(filename);                      // shows loaded frame at that instance
      }
    } else
    {
      NPCPosX = width;
      for ( int i = 0; i< NPCFrames.length; i++)
      {
        // searches for files (in data folder) with "Running" and a number extension unitl 8
        String filename = "EnemyRunningLeft" + (i+1) + ".png";
        NPCFrames[i] = loadImage(filename);                     // shows loaded frame at that instance
      }
    }
  }

  // animates and moves NPC
  void animateNPC()
  {
    if ( frameCount % NPC_Run == 0)               // show frame 'div/0' + Remainder 
    {
      NPCFrameIdx++;                             // adds next frame if remainder exists
      if ( NPCFrameIdx >= NPCFrames.length )
      {
        // resets the player frame index if it exceeds 7 (look at NPCFrames in construtor)
        NPCFrameIdx = 0;
      }
    }
    if (MoveRight) {
      NPCPosX++;            // move NPC position right
    } else { 
      NPCPosX--;            // move NPC position left
    }
  }

  // draws NPC
  void drawNPC()
  {
    imageMode(CORNER);
    // NPC is 109x103 pixels: offset -40/+30 to place feet at playerPosX/playerPosY
    image(NPCFrames[NPCFrameIdx], NPCPosX-40, NPCPosY +30);
  }
}

/**
 * Randomly selects a true or false value
 */
NPC createNPC() {
  float randomNumber = random(1);          // generates a random number
  boolean MoveRight;                       // temporary boolean 
  if (randomNumber >= 0.45) {
    
    // 54%/99% chance that the NPC moves to the right
    MoveRight = true;
  } else {
    
    // 45%/99% chance that the NPC moves to the right
    MoveRight = false;
  }
  
  // makes a new temporary NPC variable function to return the random boolean value.
  NPC npc = new NPC(MoveRight);
  return npc;
}

