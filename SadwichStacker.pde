import java.io.BufferedWriter;
import java.io.FileWriter;
import controlP5.*;

boolean homeB, firstGameB, highscoresB, gameOverB, settingsB; // prikaz pojedinih prozora

//boje
color blue = color(0, 153, 204);
color darkblue = color(0, 96, 128);
color white = color(255, 255, 255);
color black = color(0, 0, 0);

//prozori
Home home;
FirstGame firstGame;
Highscores highscores;
Settings settings;
GameOver gameOver;

ControlP5 cp5;

//slike
PImage bottomBun;
PImage dispenser;
PImage background1;
PImage background2;
PImage heart;
PImage logo;
PImage[] objectImages;
PImage leftArrow;
PFont f;

// način igre
boolean catchMode;

// je li nešto highscore ili ne
boolean isHighscore;

int score; //player game score
int numFall; //broj padajućih objekata
int difficulty;

void setup() {
  difficulty = 1; // po defaultu normalan difficulty
  size(800,600);
  catchMode = true; // po default-u je način igre t.d. uvijek slažemo isti sendvič
  score = 0; // na početku imamo 0 bodova
  numFall=16;

  // loadanje slika i podešavanje veličina
  objectImages = new PImage[numFall];
  bottomBun = loadImage("bottomBun.png");
  dispenser = loadImage("dispenser.png");
  background1 = loadImage("background.jpg");
  heart = loadImage("heart.png");
  logo = loadImage("title.png");
  leftArrow = loadImage("left-arrow.png");
  dispenser = loadImage("dispenser.png");
  heart.resize(30, 0);
  leftArrow.resize(30, 0);
  background1.resize(width, height);
  bottomBun.resize(width/7, 0);
  
  for (int i=0; i<numFall; ++i) {
    objectImages[i] = loadImage(i+".png");
    objectImages[i].resize(0, width/10);
  }
  //font
  f = loadFont("ProcessingSansPro-Semibold-48.vlw");
  textFont(f);
  // na početku vidimo Home screen
  homeB = true;
  firstGameB = false;
  highscoresB = false;
  gameOverB = false;
  settingsB = false;
  // na početku nismo ostvarili highscore
  isHighscore = false;
 
  init();
}

// kretanje
void keyPressed(){
  if(firstGameB)
    firstGame.myKeyPressed();
}
void keyReleased(){
  if(firstGameB)
    firstGame.myKeyReleased();
}

void draw() {
  if (homeB) {
    home.myDraw();
  }
  if(firstGameB) {
    firstGame.myDraw();
  }
  if(highscoresB) {
    highscores.myDraw();
  }
  if(gameOverB) {
    gameOver.myDraw();
  }
  if(settingsB) {
    settings.myDraw();
  }
}


void mousePressed() {
  if (homeB)
    home.myMousePressed();
  else if (highscoresB)
    highscores.myMousePressed();
  else if (gameOverB)
    gameOver.myMousePressed();
  else if (settingsB)
    settings.myMousePressed();
}

//provjera klika na gumb (pravokutni)
boolean overRect(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

//provjera klika na gumb (okrugli)
boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void init(){
  home = new Home();
  firstGame = new FirstGame();
  highscores = new Highscores();
  gameOver = new GameOver();
  settings = new Settings();
}
