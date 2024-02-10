class Home{
  
  int objPos;
  int a,b; // cell hight and width
  int rectW,rectH; // button width and height
  //boolean first; //first time we enter draw loop we start the music

  
  Home(){
    objPos=0;
    a=height/8; //we divide screen into 8 rows, a is the height of a row
    b=width/3; //we divide screen into 3 collumns, b is the width of a collumn
    rectW=b;
    rectH=2*a/3; //button height: 2/3 of a row
    //first=true;  
  }
  
  void myDraw(){

      //start soundtrack
      if(first==true && musicOn==true){
        song1.loop();
        first=false;
      }
      //........background...........
      background(background1);
      
      //........logo...........
      imageMode(CORNER);
      logo.resize(2*b,a*2);
      image(logo, b/2, a/2);
      
      textSize(a/3);
      textAlign(CENTER,CENTER);
      
      //.........Play button...........
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
         
      //.........Settings...........
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
      
      //.........Highscores...........
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
      
      //..........Exit...........
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


  void myMousePressed() {
    //play
    if(overRect(b, a*3, rectW, rectH)==true)
    {
      click.play();
      //secondGameB=true;
      homeB=false;
      firstGameB=true;
    }
    if(overRect(b, a*4, rectW, rectH)==true)
    {
      click.play();
      homeB=false;
      settingsB=true;

   
    }
    if(overRect(b, a*5, rectW, rectH)==true)
    {
      click.play();
      homeB=false;
      highscoresB=true;
      highscores.calculate();
    }
    if(overRect(b, a*6, rectW, rectH)==true)
    {
      click.play();
      exit();
    }
        
 
  }
  

}
