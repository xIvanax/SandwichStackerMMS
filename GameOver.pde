import controlP5.*;

class GameOver{
  ControlP5 cp5;
  String playerName; // pohrana imena koje je igrac unio na kraju igre
  Textfield nameField; // textfield u koji se unosi ime
 
  //konstruktor koji postavlja nameField
  GameOver(){
    cp5 = new ControlP5(SadwichStacker.this);
    playerName="";
    int w = 200, h = 30;
    nameField = cp5.addTextfield("nameField")
                   .setPosition(width/2-w/2, height/2)
                   .setSize(w, h)
                   .setFont(createFont("Arial", 20))
                   .setColor(color(0))
                   .setColorBackground(color(255))
                   .setColorActive(color(255))
                   .setLabel("");
                   
    nameField.hide(); //stavljamo da je skriveno u slucaju da igrac nije ostvario highscore
  }
 
  void myDraw(){
   
    background(background1);
    textAlign(CENTER);
    int a = 100;
    textSize(a);
    fill(color(0));
    text("Game over!", width/2, a*2);
   
    //ako je ostvaren highscore onda se prikazuje Textfield nameField u koji igrač može unjeti ime
    if(isHighscore){
      //prikaz poruke čestitke
      textAlign(CENTER);
      textSize(a/4);
      fill(color(0));
      text("Congratulations! You achived a highscore.", width/2, a*2+50);
      text("Enter your name: ", width/2, a*2+50+a/4);
      nameField.show(); //postavljamo vidljivost nameFielda
                     
      playerName = nameField.getText(); //dohvaćamo uneseno ime
     
      //confirm button
    if(overRect((width-100)/2,(height+100)/2,100,30)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
      }
      rect((width-100)/2,(height+100)/2,100,30);
      textSize(20);
      fill(0);
      text("Confirm!", width/2,(height+140)/2); // Draw text at position (200, 100)
    }

    //back button
    if(overCircle(50,50,50)==true){  
      fill(darkblue);
      stroke(darkblue);
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
     //ako je igrac pritisnuo gumb za povratak na početni izbornik
     if(overCircle(50,50,50)==true){
       score=0;
       gameOverB=false;
       homeB=true;
       firstGame = new FirstGame();
       nameField.hide();
       nameField.setText("");
   }
   
   //ako je igrač pritisnuo gumb confirm onda se sprema ostvareni rezultat i uneseno ime
   if(overRect((width-100)/2,(height+100)/2,100,30)==true){
     Highscore HighScore = new Highscore(playerName, score); //stvaranje nove varijable tipa Highscore
     HighScore.saveScore(HighScore);
     isHighscore = false;
     //postavljamo na početne vrijednosti potrebne za daljnju igru
     nameField.hide();
     score=0;
     gameOverB=false;
     homeB=true;
     firstGame = new FirstGame();
     playerName="";
   }
  }
}
