import processing.sound.*;

//SETUP ----------------------------------
boolean setUp = true; //if setup fails the boolean is changed.
boolean mainMenu = true;
boolean gameOver = false;
boolean gameOverMenu = false;
boolean playing = false;
boolean credits = false;
boolean freeze= false;
boolean won = false;
int counter = 0;
int counter2 = 0;
float speed = 30; //Displacement between each position
int direction = 0; //0=up, 1=right, 2=down, 3=left
PFont font;
PFont fontBig;

//MAINMENU & LASTMENU ----------------------------------
PImage mainMenuImage;
PImage gameOverMenuImage;

//CHARACTER ----------------------------------
int cX = 300;
int cY= 300; //X position and Y position of character (c)
PImage characterUp, characterDown, characterLeft, characterRight;
int matrixPosX = 10; //Starting character X position within the matrix.
int matrixPosY = 10; //Starting character Y position within the matrix

//BACKGROUND&STUFF ----------------------------------
float bX, bY = 0; //Background (b) positions within the screen
float imgWidth = 5064;
float imgHeight = 2154;
PImage background;

//GHOSTS ----------------------------------
PImage ghost;
Ghost g1 = new Ghost(1,19,39);
Ghost g2 = new Ghost(2,43,28);
Ghost g3 = new Ghost(3,80,36);
Ghost g4 = new Ghost(4,108,45);
Ghost g5 = new Ghost(5,137,23);
Ghost g6 = new Ghost(6,151,43);

//FUSES ----------------------------------
PImage fuse;
int fusesNumber = 0;//number of fuses collected
Fuse f1 = new Fuse(1,4,34);
Fuse f2 = new Fuse(2,27,48);
Fuse f3 = new Fuse(3,93,54);
Fuse f4 = new Fuse(4,92,21);
Fuse f5 = new Fuse(5,150,56);
Fuse f6 = new Fuse(6,50,15);

//LANTERN&BATTERY
float battery = 90;
PImage lanternLayer;

//AUDIO ----------------------------------
SoundFile bMusic;
SoundFile allFuses;
SoundFile collectFuse;
SoundFile death;
SoundFile doorOpen;
boolean playedAllFuses = false;

//----------------------------------------------------------------------------------------------------------------------------------------

//SETUP ----------------------------------
void setup(){
  size(600,600); //Screen size, 600x600 pixels
  mainMenuImage = loadImage("Cover600.png");//MainMenu
  gameOverMenuImage = loadImage("fondo.png");
  frameRate(30);//30 frames per second
  smooth();
  background = loadImage("map.png"); //map
  lanternLayer = loadImage("lantern.png"); //lantern
  characterUp = loadImage("characterUP.png");//character
  characterDown = loadImage("characterDOWN.png");//character
  characterLeft = loadImage("characterLEFT.png");//character
  characterRight = loadImage("characterRIGHT.png");//character
  fuse = loadImage("fuse.png");//fuse
  ghost = loadImage("ghost.png");//ghost
  bMusic = new SoundFile(this,"bMusic.wav");
  allFuses = new SoundFile(this,"allFuses.wav");
  collectFuse = new SoundFile(this,"collectFuse.wav");
  death = new SoundFile(this,"death.wav");
  doorOpen = new SoundFile(this,"doorOpen.wav");
  bMusic.stop();
  bMusic.loop();
  font = createFont("Lobster 1.4.otf", 42);
  fontBig = createFont("Lobster 1.4.otf", 52);
}

//Screen "drawing" (animations)
void draw(){
  //CHECK IF SETUP WAS EXECUTED CORRECTLY----------------------------------
  if(!setUp){
    background(0,0,0);
    textSize(32);
    text("Something went wrong", 0,200);
    
  //DISPLAY MAIN MENU ----------------------------------
  }else if(mainMenu){
    image(mainMenuImage, 0, 0);
    textAlign(CENTER);
    PFont font;
    PFont fontBig;
    font = createFont("Lobster 1.4.otf", 42);
    fontBig = createFont("Lobster 1.4.otf", 52);
    textFont(font);
    fill(255, 217, 204);
    text("-----·-----", 300, 340);
    fill(999, 999, 999);
    if(dist(mouseX,mouseY,300, 386)<25){
      textFont(fontBig);
      text("Play Game", 300, 400);
    } else {
      textFont(font);
      text("Play Game", 300, 400);
    }
    /*
    if(dist(mouseX,mouseY,300,450)<20){
      textFont(fontBig);
      text("Credits", 300, 460);
    } else {
      textFont(font);
      text("Credits", 300, 460);
    } */
    
  //DISPLAY DURING GAME ----------------------------------
  }else if(playing) {
    counter2++;
    background(0);
    image(background,bX,bY,imgWidth,imgHeight);
    switch(direction){
      case 0: image(characterUp,cX,cY,30,30); break;
      case 1: image(characterRight,cX,cY,30,30); break;
      case 2: image(characterDown,cX,cY,30,30); break;
      case 3: image(characterLeft,cX,cY,30,30); break;
    }
    f1.fusePlacement();
    f2.fusePlacement();
    f3.fusePlacement();
    f4.fusePlacement();
    f5.fusePlacement();
    f6.fusePlacement();
    g1.move();
    g2.move();
    g3.move();
    g4.move();
    g5.move();
    g6.move();
    image(lanternLayer,-50,-50,700,700);
    if(counter2 < 300){
        displayText();
    }
    barFuses();
    barBattery();
    counter++;
    if(battery != 0 && counter == 30){
      battery--;
      counter = 0; 
    }
    if(fusesNumber == 6 && !playedAllFuses){
      allFuses.play();
      playedAllFuses = true;
    }   
    if(fusesNumber == 6 && (matrixPosX == 159 || matrixPosX == 160) && (matrixPosY == 15 || matrixPosY == 16)){
      doorOpen.play();
      playing = false;
      freeze = true;
      won = true;
      counter = 0;
    }
    
  //DISPLAY AFTER GAMEOVER (FIRST FREEZE THEN MENU)----------------------------------
    } else if (gameOverMenu){
      image(gameOverMenuImage, 0, 0, 600,600);
      textAlign(CENTER);
      textFont(font);
      fill(255, 217, 204);
      text("-----·-----", 300, 340);
      fill(999, 999, 999);
        textFont(fontBig);
        if(won){
        text("You won", 300, 260);
        } else{
          text("You lost", 300, 260);
        }
      if(dist(mouseX,mouseY,300, 386)<25){
        textFont(fontBig);
        text("Play Again", 300, 400);
      } else {
        textFont(font);
        text("Play Again", 300, 400);
      }
    } else if (freeze){
      counter++;
      if(counter > 120){
        gameOverMenu = true;
        freeze = false;
      }
      if(!gameOver){
      }else{
      background(0);
      image(background,bX,bY,imgWidth,imgHeight);
      background(0);
      image(background,bX,bY,imgWidth,imgHeight);
      switch(direction){
        case 0: image(characterUp,cX,cY,30,30); break;
        case 1: image(characterRight,cX,cY,30,30); break;
        case 2: image(characterDown,cX,cY,30,30); break;
        case 3: image(characterLeft,cX,cY,30,30); break;
      }
      f1.fusePlacement();
      f2.fusePlacement();
      f3.fusePlacement();
      f4.fusePlacement();
      f5.fusePlacement();
      f6.fusePlacement();
      g1.move();
      g2.move();
      g3.move();
      g4.move();
      g5.move();
      g6.move();
      image(lanternLayer,-50,-50,700,700);  
      barFuses();
      barBattery();
      }
    }
}

void keyPressed(KeyEvent e){
 if(key == CODED){
  try{
    if((matrixPosX+1<=168 || matrixPosX-1>=0 || matrixPosY+1<=71 || matrixPosY-1>=0) && playing){
      if(keyCode == UP  && (limMatrix[matrixPosY-1][matrixPosX] != 1) && (limMatrix[matrixPosY][matrixPosX+1] != 3)){
        direction = 0;
        bY += speed;
        g1.gpy += speed;
        g2.gpy += speed;
        g3.gpy += speed;
        g4.gpy += speed;
        g5.gpy += speed;
        g6.gpy += speed;
        f1.fpy += speed;
        f2.fpy += speed;
        f3.fpy += speed;
        f4.fpy += speed;
        f5.fpy += speed;
        f6.fpy += speed;
        matrixPosY--;
      } else if(keyCode == DOWN && (limMatrix[matrixPosY+1][matrixPosX] != 1) && (limMatrix[matrixPosY][matrixPosX+1] != 3)){
        direction = 2;
        bY -= speed;
        g1.gpy -= speed;
        g2.gpy -= speed;
        g3.gpy -= speed;
        g4.gpy -= speed;
        g5.gpy -= speed;
        g6.gpy -= speed;
        f1.fpy -= speed;
        f2.fpy -= speed;
        f3.fpy -= speed;
        f4.fpy -= speed;
        f5.fpy -= speed;
        f6.fpy -= speed;
        matrixPosY++;
      } else if(keyCode == LEFT && (limMatrix[matrixPosY][matrixPosX-1] != 1) && (limMatrix[matrixPosY][matrixPosX+1] != 3)){
        direction = 3;
        bX += speed;
        g1.gpx += speed;
        g2.gpx += speed;
        g3.gpx += speed;
        g4.gpx += speed;
        g5.gpx += speed;
        g6.gpx += speed;
        f1.fpx += speed;
        f2.fpx += speed;
        f3.fpx += speed;
        f4.fpx += speed;
        f5.fpx += speed;
        f6.fpx += speed;
        matrixPosX--;
      } else if(keyCode == RIGHT && ((limMatrix[matrixPosY][matrixPosX+1] != 1)) && (limMatrix[matrixPosY][matrixPosX+1] != 3)){
        direction = 1;
        bX -= speed;
        g1.gpx -= speed;
        g2.gpx -= speed;
        g3.gpx -= speed;
        g4.gpx -= speed;
        g5.gpx -= speed;
        g6.gpx -= speed;
        f1.fpx -= speed;
        f2.fpx -= speed;
        f3.fpx -= speed;
        f4.fpx -= speed;
        f5.fpx -= speed;
        f6.fpx -= speed;
        matrixPosX++;
      } else if(keyCode == UP){
        direction = 0;  
      } else if(keyCode == DOWN){
        direction = 2;
      } else if(keyCode == RIGHT){
        direction = 1;
      } else if(keyCode == LEFT){
        direction = 3;
      } else if(keyCode == 32){ //SPACE BAR ASCII = 32
      }
    }
   } catch(Exception f){
   }
 }
}

void mouseClicked(){
  if(dist(mouseX,mouseY,300, 386)<25 && (mainMenu == true || gameOverMenu == true)){
    mainMenu = false;
    gameOver = false;
    gameOverMenu = false;
    playing = true;
    f1 = new Fuse(1,4,34);
    f2 = new Fuse(2,27,48);
    f3 = new Fuse(3,93,54);
    f4 = new Fuse(4,92,21);
    f5 = new Fuse(5,150,56);
    f6 = new Fuse(6,50,15);
    g1 = new Ghost(1,19,39);
    g2 = new Ghost(2,43,28);
    g3 = new Ghost(3,80,36);
    g4 = new Ghost(4,108,45);
    g5 = new Ghost(5,137,23);
    g6 = new Ghost(6,151,43);
    bX = 0;
    bY = 0;
    fusesNumber = 0;
    battery = 90;
    matrixPosX = 10;
    matrixPosY = 10;
  }
  if(dist(mouseX,mouseY,300,450)<20 && (mainMenu == true || gameOverMenu == true)){
    mainMenu = false;
    freeze = false;
    gameOverMenu = false;
    credits = true;
  }
}
