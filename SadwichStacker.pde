import java.io.BufferedWriter;
import java.io.FileWriter;


boolean homeB, firstGameB, highscoresB, gameOverB, settingsB;

Home home;
FirstGame firstGame;
Highscores highscores;
GameOver gameOver;
Settings settings;

PImage bottomBun;
PImage dispenser;
PImage background1;
PImage background2;
PImage heart;
PImage heartEmpty;
PImage logo;
PImage[] objectImages;
PFont f;

boolean specialCatchMode;
boolean mode; //true->mouse, false ->keyboard
int score; //player game score
int numFall; //number of falling object
int X=0;
int size;
int difficulty;
boolean first=true;//used to play music only once

void setup() {
  size=1;
  difficulty=1;
  size(800,600);
  
  score=0;
  numFall=29;

// loadanje slika
  objectImages = new PImage[numFall];

  dispenser = loadImage("dispenser.png");
  background1 = loadImage("background.jpg");
  heart = loadImage("heart.png");
  heartEmpty = loadImage("heartEmpty.png");
  logo = loadImage("title.png");

  heart.resize(30, 0);
  heartEmpty.resize(30, 0);

  f = loadFont("ProcessingSansPro-Semibold-48.vlw");
  textFont(f);
  
  homeB = true;
  firstGameB = false;
  highscoresB = false;
  gameOverB = false;
  settingsB = false;
  
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
