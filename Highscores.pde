class Highscores{
  ArrayList<Highscore> lista; //tu ce biti ucitani podaci iz datoteke
  int a,b;

  Highscores(){
    a=height/15;
    b=width/10;
    lista = new ArrayList<Highscore>();
  }

  //funkcija koja ucitava podatke te prikazuje listu najboljih ostvarenih rezultata
  void myDraw(){
    background(background1);

    textAlign(CENTER);
    textSize(a);
    fill(color(0));
    text("Top 5", width/2, a*2);


    textAlign(CENTER,CENTER);
    textSize(a);
    fill(color(0));
    text("Position", b*2.5 ,a*3.5);
    text("Score", b*4.5, a*3.5);
    text("Name", b*7, a*3.5);
    stroke(color(0));
    line(b, a*4, b*9, a*4);
    line(b, a*4-2, b*9, a*4-2);

    Highscore h = new Highscore();
    lista = h.loadHighscores();

    //fill the score table
    textAlign(CENTER, CENTER);
    for(int i = 0; i<5 && i<lista.size();++i){
      fill(color(0));
      text((i+1)+". ", b*2.5 ,a*(i+4.5));
      fill(color(0));
      text(lista.get(i).scoreValue, b*4.5, a*(i+4.5));
      text(lista.get(i).playerName, b*7, a*(i+4.5));
      fill(color(0));
      line(b, a*(i+5), b*9, a*(i+5));
    }
    //back button
    if(overCircle(50,50,50)==true){
      fill(darkblue);
      stroke(black);
    }
    else{
      fill(blue);
      stroke(black);
    }
    circle(50, 50, 50);
    imageMode(CENTER);
    image(leftArrow,50,50);
  }

  void myMousePressed() {
    //go back
   if(overCircle(50,50,50)==true){
     homeB=true;
     highscoresB=false;
   }
  }
}
