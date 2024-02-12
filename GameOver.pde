class GameOver{
  void myDraw(){
    
    background(background1);

    textAlign(CENTER);
    int a = 100;
    textSize(a);
    fill(color(darkblue));
    text("U ded", width/2, a*2);
    

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
//    image(leftArrow,50,50);
    
  }

  void myMousePressed() { //ne radi, dunno why
    //go back
   if(overCircle(50,50,50)==true){     
     print("a");
     gameOverB=false;
     homeB=true;
   }
   else{
     print("b");
   }
  }
}
