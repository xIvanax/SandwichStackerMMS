import java.io.BufferedWriter;
import java.io.FileWriter;
import controlP5.*;

boolean homeB, firstGameB, highscoresB, gameOverB, settingsB;

//colores
color yellow = color(255, 255, 102);
color blue = color(0, 153, 204);
color darkblue = color(0, 96, 128);
color lightblue = color(153, 230, 255);
color green = color(64, 191, 64);
color darkgreen = color(38, 115, 38);
color lightgreen = color(159, 223, 159);
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color orange = color(255, 153, 51);
color red = color(226, 0, 0);

Home home;
FirstGame firstGame;
Highscores highscores;
Settings settings;
GameOver gameOver;

ControlP5 cp5;

PImage bottomBun;
PImage dispenser;
PImage background1;
PImage background2;
PImage heart;
PImage heartEmpty;
PImage logo;
PImage leftArrow;
PImage[] objectImages;
PFont f;

boolean catchMode;
boolean isHighscore;
boolean mode; //true->mouse, false ->keyboard
int score; //player game score
int numFall; //number of falling object
int X=0;
int size;
int difficulty;

void setup() {
  size=1;
  difficulty=1;
  catchMode = true;
  size(800,600);
  
  score=0;
  numFall=13;

// loadanje slika
  objectImages = new PImage[numFall];

  dispenser = loadImage("dispenser.png");
  background1 = loadImage("background.jpg");
  heart = loadImage("heart.png");
  heartEmpty = loadImage("heartEmpty.png");
  logo = loadImage("title.png");
  leftArrow = loadImage("left-arrow.png");

  heart.resize(30, 0);
  heartEmpty.resize(30, 0);
  leftArrow.resize(35, 0);

  f = loadFont("ProcessingSansPro-Semibold-48.vlw");
  textFont(f);
  
  homeB = true;
  firstGameB = false;
  highscoresB = false;
  gameOverB = false;
  settingsB = false;
  
  isHighscore = false;
  
  init();
  

}

void keyPressed(){
  if(firstGameB) firstGame.myKeyPressed();
}

void keyReleased(){
  if(firstGameB) firstGame.myKeyReleased();
}

void draw() {
  if ( homeB ) {
    home.myDraw();
  }
  if ( firstGameB ) {
    firstGame.myDraw();
  }
  if ( highscoresB ) {
    highscores.myDraw();
  }
  if ( gameOverB ) {
    gameOver.myDraw();
  }
  if ( settingsB ) {
    settings.myDraw();
  }

}


void mousePressed() {
  if (homeB) home.myMousePressed();
  else if (firstGameB) firstGame.myMousePressed();
  else if (highscoresB) highscores.myMousePressed();
  else if (gameOverB) gameOver.myMousePressed();
  else if (settingsB) settings.myMousePressed();
}

//Check if mouse hovers over rectangle
boolean overRect(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//appends text to file
void appendTextToFile(String filename, String text) {
  File f = new File(dataPath(filename));
  if (!f.exists()) {
    try {
    f.createNewFile();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
    out.println(text);
    out.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}


void init(){
  
  background1.resize(width, height);
  
  bottomBun = loadImage("bottomBun.png");
  bottomBun.resize(width/7, 0);
  X=bottomBun.width/2;
  
  dispenser = loadImage("dispenser.png");
  
  for (int i=0; i<numFall; ++i) {
    objectImages[i] = loadImage(i+".png");
    objectImages[i].resize(0, width/10);
  }
  
  logo = loadImage("title.png");
  
  home = new Home();
  firstGame = new FirstGame();
  highscores = new Highscores();
  gameOver = new GameOver();
  settings = new Settings();

}
