class Settings{
  int a,b;
  int rectW, rectH;
  boolean catchModetmp;
  int difficultytmp;

  
  Settings(){
    a=height/10;
    b=width/3;
    rectW=b + 50; // sirina gumba
    rectH=2*a/3; // visina gumba
    catchModetmp=catchMode;
    difficultytmp=difficulty;
  }
  
  void myDraw(){
    
    background(background1);
    textAlign(CENTER,CENTER);
    textSize(a/3);
    
   if(overRect(b, a*2, rectW, rectH)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*2, rectW, rectH, 20);
    fill(white);

    if(catchModetmp==true){
      text("Keep making the same sandwich!", width/2 + 25, rectH/2 + a*2);
    }
    else{
      text("Switch it up!", width/2 + 25, rectH/2 + a*2);
    }
    
    //tezina
    fill(blue);
    stroke(blue);
    rect(b, a*3, rectW, rectH, 20);
    fill(white);
    text("Difficulty:", width/2 + 25, a*3+rectH/2);
    //<
   if(overRect(b, a*4, b*0.2, a/2)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*4, b*0.2, a/2, 20);
    fill(white);
    text("<", b*1.1, a*4.25);
    
    //size
    fill(darkblue);
    if(difficultytmp==0)
      text("easy", b*1.5 + 25, a*4.25);
    else if(difficultytmp==1)
      text("normal", b*1.5 + 25, a*4.25);
    else if(difficultytmp==2)
      text("hard", b*1.5 + 25, a*4.25);
    else
      text("pro", b*1.5 + 25, a*4.25);
      
    
    //>
   if(overRect(b*1.8 + 50, a*4, b*0.2, a/2)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b*1.8 + 50, a*4, b*0.2, a/2, 20);
    fill(white);
    text(">", b*1.9 + 50, a*4.25);
    
    //APPLY
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
    text("APPLY", width/2 + 25, a*5+rectH/2);

    //gumb za povratak na početni izbornik
    if(overCircle(50,50,50)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    circle(50, 50, 50);
    imageMode(CENTER);
    image(leftArrow,50,50);
  }

// podesavanje tezine i nacina igre kao reakcija na klikove na gumbe
  void myMousePressed() {
    if (overRect(b, a*2, rectW, rectH)==true){
      if(catchModetmp==true){
        catchModetmp=false;
      }
      else{
        catchModetmp=true;
      }
    }
   else if (overRect(b, a*4, b*0.2, a/2)==true){
     if(difficultytmp>0)
       difficultytmp=(difficultytmp-1)%4;
     else
       difficultytmp=3;
   }
   else if (overRect(b*1.8, a*4, b*0.2, a/2)==true){
     difficultytmp=(difficultytmp+1)%4;
   }
   //primjena svojstava
   else if (overRect(b, a*5, rectW, rectH)==true){
     difficulty=difficultytmp;
     catchMode=catchModetmp;
     init();
   }
    
    //gumb za povratak na početni izbornik
   if(overCircle(50,50,50)==true){
     homeB=true;
     settingsB=false;
   }
  }
  

  
}
