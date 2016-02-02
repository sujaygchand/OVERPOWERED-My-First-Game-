// Constant values to be used in conjuction with other methods to produce animation 
final int IDLE = 1;     // player idle value  
final int LEFT_RUN = 5;    // player running left value
final int RIGHT_RUN = 5;     // player running right value
final int NPC_Run = 7;  // NPC movement value

// Initialises when switched to GAME state
void startGame()
{   
  gameState = STATE_GAME;     // current game state
  playerPosX = 200;           // player's initial x value
  playerPosY= height/2;       // player's initial y value

  loadIdleFrames();           

  // initialises the minim instance as 'sound'
  sound = new Minim(this);

  // loads music track into 'player1'
  player1 = sound.loadFile("Captain Commando music - City.mp3");                      // Reference 4a
  // plays and loops the track 
  player1.loop();

  // loads music tracks for respective players
  player2 = sound.loadFile("Captain Commando Theme-Marvel VS Capcom Music.mp3");     // Reference 4b
  player3 = sound.loadFile("Another Winter.mp3");                                    // Reference 4c
  player4 = sound.loadFile("Mega Man 2 Dr. Wily Stage 1 -- Epic Game Music.mp3");    // Reference 4d

  // Sets the average gain of track to -45dB
  player1.setGain(-45);
  player2.setGain(-45);
  player3.setGain(-45);
  player4.setGain(-45);

  // loads dying sound effect
  dyingSFX = sound.loadSample("Scott Pilgrim K.O. Sound Effect.mp3");                // Reference 4e

  // only 'player1' plays when game is setup
  player1Active = true;
  player2Active = false;
  player3Active = false;
  player4Active = false;

  NPCList = new ArrayList<NPC>(); // initialising the list 

  // Create first enemy
  NPCList.add(createNPC());

  // Stages
  bg = loadImage("Stage1.png"); // Reference 5b

  gameActive = true;            // Game is active
}

/**
 * Subfunction for drawing the screen when in GAME state.
 */
void draw_Game() 
{
  // draws game when its boolean is activated.
  if (gameActive)
  {  
    background(bg);            // stage background

    // draws text for kills  
    stroke(0);
    fill(random(150, 256));
    textSize(21);
    textAlign(CENTER);
    text("KILLS: " + kills, width-55, 20 );    // the intger of kills adds to text 

    // draws the remaining text
    fill(white);
    textSize(21);
    textAlign(CORNER);
    text("Press ENTER to quit to Menu", 10, 20 );
    text("Press P to end simulation", 10, 45);     

    // generates player
    animatePlayer();
    drawPlayer();

    // creates a temporary NPC object from the NPC class 
    NPC tempNPC=null;

    // draws a new NPC if it has not been killed
    for (NPC npc : NPCList) {    
      if (!killed) {

        npc.animateNPC();
        npc.drawNPC();

        // collision detection between player and NPC.
        if ( dist(playerPosX, 0, npc.NPCPosX, 0) <=  5) 
        {
          tempNPC = npc;            // temporary NPC gets assigned as npc
          dyingSFX.trigger();       // dying sound effect is played
          dyingSFX.setGain(-36);    // sets the gain to be higher than background track.
          kills++;                  // total kills increases
        }
      }
    }

    // when temporary NPC is not null, then removes from screen
    if (tempNPC != null) {  
      NPCList.remove(tempNPC);
    }

    // load relavent frames, when moving to the right.
    if (keyCode == RIGHT) 
    {
      loadRightRunFrames();
    }


    // load relavent frames, when moving to the left.
    if (keyCode == LEFT)
    {

      loadLeftRunFrames();
    }

    // invisble wall on left
    if ( playerPosX <= 40)
    {
      playerPosX = 40;
    }

    // invisble wall on right
    if ( playerPosX >= width-40)
    {
      playerPosX = width-40;
    }
  }
}

/**
 * Subfunction for handling key presses when in GAME state.
 */
void keyPressed_Game()
{
  // transition frames if moving right.
  if (keyCode == RIGHT) {
    animatePlayerRunRight();
    drawPlayer();
    playerPosX= playerPosX+3;          // increases player's velocity
  }

  // transition frames if moving left.
  if (keyCode == LEFT) {

    animatePlayerRunLeft();
    drawPlayer();
    playerPosX= playerPosX-3;          // increases player's velocity
  }

  // spawns new npc
  if (key == ' ')
  {
    NPCList.add(createNPC());
  }

  // opens menu, while deactiving GAME state and pauses background music
  if ( keyCode == ENTER )
  {
    openMenu();
    gameActive = false;
    player1.pause();
    player2.pause();
    player3.pause();
    player4.pause();
  }

  // changes background to stage 1
  if (key == 'q')
  {
    bg = loadImage("Stage1.png");      // Reference 5b
  }

  // changes background to stage 2
  if (key == 'w')
  {
    bg = loadImage("Stage2.png");     // Reference 5b
  }

  // changes background to stage 3
  if (key == 'e')
  {
    bg = loadImage("Stage3.png");    // Reference 5b
  }

  // changes background to stage 4
  if (key == 'r')
  {
    bg = loadImage("Stage4.png");    // Reference 5b
  }

  // stops other background song and activates player 1
  if (key == '1' &&  !player1Active)
  {
    player2.pause();
    player3.pause();
    player4.pause();
    player1.loop();
    player1Active = true;
    player2Active = false;
    player3Active = false;
    player4Active = false;
  }

  // stops other background song and activates player 2
  if (key == '2' &&  !player2Active)
  {
    player1.pause();
    player3.pause();
    player4.pause();
    player2.loop();
    player1Active = false;
    player2Active = true;
    player3Active = false;
    player4Active = false;
  }

  // stops other background song and activates player 3
  if (key == '3' &&  !player3Active)
  {
    player1.pause();
    player2.pause();
    player4.pause();
    player3.loop();
    player1Active = false;
    player2Active = false;
    player3Active = true;
    player4Active = false;
  }

  // stops other background song and activates player 4
  if (key == '4' &&  !player4Active)
  {
    player1.pause();
    player2.pause();
    player3.pause();
    player4.loop();
    player1Active = false;
    player2Active = false;
    player3Active = false;
    player4Active = true;
  }

  // Changes to END state
  if (key == 'p')
  {
    endGame();
  }
}

