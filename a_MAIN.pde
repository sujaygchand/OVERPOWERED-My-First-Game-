/**
 * COMP570 Programming for Creativity 2015 S1
 *
 * OVERPOWERED: SIMULATOR 2015 B.C. Ultra Super Turbo Arcade Edition Version
 *
 * This is program is a game (simulator) for reliving stress. The program is modelled as a basic 
 * beat 'em up, where the player is kept inside of a screen.
 * Additionally, the background and sound can be changed in realtime. 
 * In this simulator the character is overpowered, thus there is no difficulty.
 * But, there are a few secrets hidden in the game/code. 
 *
 * References:
 * 1. Character Spritesheet: http://www.spriters-resource.com/arcade/capcommand/sheet/55189/
 *
 * 2. NPC Spritesheet: http://www.spriters-resource.com/arcade/capcommand/sheet/54705/
 *
 * 3. Backgrounds:
 * a. http://imagizer.imageshack.com/download/19/pssmst6a.png
 * b. http://indiegamehq.com/introducing-beating-quota-riot-themed-beat-em-decaying-logic/
 * 
 * 4. Sound:
 * a. https://www.youtube.com/watch?v=orcrbhbShKc
 * b. https://www.youtube.com/watch?v=PdW4P2O95B8
 * c. https://www.youtube.com/watch?v=BkF2cmBx8a8
 * d. https://www.youtube.com/watch?v=JTSFsGUlJzg
 * e. https://www.youtube.com/watch?v=fVPJuGIuUMU
 * f. https://www.youtube.com/watch?v=D9HRqJY1Yz8
 *
 * 5. Images:
 * a. http://diabalzane.com/wp-content/uploads/2014/05/Personnages-celebres-Troll-face-260360.png
 * b. Multiple images from google images (Some of which have been PhotoShopped).
 *
 * 6. Video Links:
 * a. https://www.youtube.com/watch?v=xfr64zoBTAQ
 * b. https://www.youtube.com/watch?v=pzDgaGTARqE
 *
 * 7. Code:
 * a. GameStates posted on Blackboard by Stefan.
 * b. Lecture 09 (P.g. 38-40).
 * c. Multiple pieces of codes from material taught over the semestar.  
 *
 *@author Sujay Chand
 *@version 1.0 - 03.06.2015: Created
 */

// use the minim library
import ddf.minim.*;

AudioPlayer player1, player2, player3, player4;

AudioSample dyingSFX, nextBattle;

Minim sound;

// Constants representing states of the game
final int STATE_INTRO = 0;
final int STATE_GAME = 1;
final int STATE_MENU = 2;
final int STATE_END = 3;
final int STATE_TROLL = 4;

/** 
 * Global variables
 */

int gameState;                 // current state of game
color white = color(255);      // labeling white's global variable 
color black = color(0);        // labeling black's global variable 

// Variables used in the MENU state
PImage menuBG;
int rightKeyPressed;

/**
 * Variables used mainly in GAME state
 */

PImage bg;                              // background image for GAME state

// Varibles for player
PImage[]   playerFrames;              // player's current frame
int        playerFrameIdx;            // player's index frame 
float      playerPosX, playerPosY;    // player's x and y coordinate
int        kills;                     // amount of enemies killed by player

// Varibles for NPC
ArrayList<NPC> NPCList;               // list for NPC is initially null
boolean        killed;                // checks if NPC has been killed

// Checks if respective audio players are playing and stops tracks from overlapping
boolean player1Active;
boolean player2Active;
boolean player3Active;
boolean player4Active;

// checks if game is running
boolean gameActive;

// Varible for TROLL state
PImage Troll;                        // image for TROLL state

// Initialises setup
void setup()
{
  size(900, 400);
}

void draw()
{
  // assigns the appropriate draw subfunction, depending on the game state 
  switch (gameState)
  {
  case STATE_INTRO : 
    draw_Intro(); 
    break;
  case STATE_MENU : 
    draw_Menu(); 
    break;
  case STATE_GAME : 
    draw_Game(); 
    break;
  case STATE_END : 
    draw_End(); 
    break;
  case STATE_TROLL : 
    draw_Troll(); 
    break;
  }
}

void keyPressed() 
{
  // assigns the appropriate draw subfunction, depending on the game state
  switch ( gameState )
  {
  case STATE_INTRO : 
    keyPressed_Intro(); 
    break;
  case STATE_MENU : 
    keyPressed_Menu(); 
    break;
  case STATE_GAME : 
    keyPressed_Game(); 
    break;
  case STATE_END : 
    keyPressed_End(); 
    break;
  case STATE_TROLL : 
    keyPressed_Troll(); 
    break;
  }

  // when 'ESC' key is pressed, opens link to video (an add-on to troll function's purpose)
  if (keyCode == ESC)
  {
    link("https://www.youtube.com/watch?v=xfr64zoBTAQ");               // Reference 6a
  }
}

void mousePressed()
{
  // when mouse is pressed, mimics the function assigned to 'ESC'
  link("https://www.youtube.com/watch?v=xfr64zoBTAQ");                // Reference 6a
}

void stop() {
  // cleans up the sound
  player1.close();
  player1 = null;
  player2.close();
  player2 = null;
  player3.close();
  player3 = null;
  player4.close();
  player4 = null;
  dyingSFX.close();
  dyingSFX = null;
  nextBattle.close();
  nextBattle = null;

  // cleans the Minim instance
  sound.stop();
  sound = null;
  // stops the rest of the program
  super.stop();
}

