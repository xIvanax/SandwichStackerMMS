class Home{
  int objPos;
  int a,b; // visina i sirina ćelija
  int rectW,rectH; // visina i širina gumba
  
  Home(){
    objPos=0;
    a=height/8; // dijelim ekran u 8 redaka
    b=width/3; // dijelim ekran u 3 stupca
    rectW=b;
    rectH=2*a/3; // gumb je visok 2/3 retka
  }
  
  void myDraw(){
      // pozadina i logo
      background(background1);
      imageMode(CORNER);
      logo.resize(2*b,a*2);
      image(logo, b/2, a/2);
      textSize(a/3);
      textAlign(CENTER,CENTER);
      // gumb za pokretanje same igre
      if(overRect(b, a*3, rectW, rectH)==true){  
        fill(darkblue);
        stroke(darkblue);
      }
      else{
        fill(blue);
        stroke(blue);
      }
      rect(b, a*3, rectW, rectH, 20);
      fill(white);
      text("Play", width/2, a*3+rectH/2);
      // gumb za settings
      if(overRect(b, a*4, rectW, rectH)==true){  
        fill(darkblue);
        stroke(darkblue);
      }
      else{
        fill(blue);
        stroke(blue);
      }
      rect(b, a*4, rectW, rectH, 20);
      fill(white);
      text("Settings", width/2, a*4+rectH/2);
      //gumb za highscores
      if(overRect(b, a*5, rectW, rectH)==true){  
        fill(darkblue);
        stroke(darkblue);
      }
      else{
        fill(blue);
        stroke(blue);
      }
      rect(b, a*5, rectW, rectH, 20);
      fill(white);
      text("Highscores", width/2, a*5+rectH/2);
      //gumb za izlazak iz čitave igre
      if(overRect(b, a*6, rectW, rectH)==true){  
        fill(darkblue);
        stroke(darkblue);
      }
      else{
        fill(blue);
        stroke(blue);
      }
      rect(b, a*6, rectW, rectH, 20);
      fill(white);
      text("Exit", width/2, a*6+rectH/2);
  }
  // ovdje se handle-a pritisak na pojedini gumb na Home ekranu
  void myMousePressed() {
    if(overRect(b, a*3, rectW, rectH)==true)
    {
      homeB=false;
      firstGameB=true;
    }
    if(overRect(b, a*4, rectW, rectH)==true)
    {
      homeB=false;
      settingsB=true;
    }
    if(overRect(b, a*5, rectW, rectH)==true)
    {
      homeB=false;
      highscoresB=true;
    }
    if(overRect(b, a*6, rectW, rectH)==true)
    {
      exit();
    }
  }
}
