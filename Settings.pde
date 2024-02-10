class Settings{
  int a,b;
  int rectW, rectH;
  int sizetmp;
  int difficultytmp;

  
  Settings(){
    a=height/10;
    b=width/3;
    rectW=b;
    rectH=2*a/3;
    sizetmp=size;
    difficultytmp=difficulty;
  }
  
  void myDraw(){
    
    background(background1);
    textAlign(CENTER,CENTER);
    textSize(a/3);
    
    //Specific object catch button............................
   if(overRect(b, 10, rectW, rectH)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, 10, rectW, rectH, 20);
    fill(white);

    if(specialCatchMode==true){
      text("Catch only cupcakes!", width/2, rectH/2 + 10);
    }
    else{
      text("Catch 'em all!", width/2, rectH/2 + 10);
    }
    
    //Music On/Off button............................
   if(overRect(b, a, rectW, rectH)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a, rectW, rectH, 20);
    fill(white);

    if(musicOn==true){
      text("Music: on", width/2, a+rectH/2);
    }
    else{
      text("Music: off", width/2, a+rectH/2);
    }
    
    //Music volume.................................
    fill(blue);
    stroke(blue);
    rect(b, a*2, rectW, rectH, 20);
    fill(white);
    text("Music volume:", width/2, a*2+rectH/2);
    
    //-
   if(overRect(b, a*3, b*0.2, a/2)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*3, b*0.2, a/2, 20);
    fill(white);
    text("-", b*1.1, a*3.25);
    
    //volume
    fill(darkblue);
    text(volume, b*1.5, a*3.25);
    
    //+
   if(overRect(b*1.8, a*3, b*0.2, a/2)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b*1.8, a*3, b*0.2, a/2, 20);
    fill(white);
    text("+", b*1.9, a*3.25);
    
    
    //Screen size.................................
    fill(blue);
    stroke(blue);
    rect(b, a*4, rectW, rectH, 20);
    fill(white);
    text("Screen size:", width/2, a*4+rectH/2);
    //<
   if(overRect(b, a*5, b*0.2, a/2)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*5, b*0.2, a/2, 20);
    fill(white);
    text("<", b*1.1, a*5.25);
    
    //size
    fill(darkblue);
    if(sizetmp==0)
      text("small", b*1.5, a*5.25);
    else if(sizetmp==1)
      text("medium", b*1.5, a*5.25);
    else if(sizetmp==2)
      text("large", b*1.5, a*5.25);
    else
      text("very large", b*1.5, a*5.25);
      
    
    //>
   if(overRect(b*1.8, a*5, b*0.2, a/2)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b*1.8, a*5, b*0.2, a/2, 20);
    fill(white);
    text(">", b*1.9, a*5.25);
    
    
    //Difficulty.................................
    fill(blue);
    stroke(blue);
    rect(b, a*6, rectW, rectH, 20);
    fill(white);
    text("Difficulty:", width/2, a*6+rectH/2);
    //<
   if(overRect(b, a*7, b*0.2, a/2)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*7, b*0.2, a/2, 20);
    fill(white);
    text("<", b*1.1, a*7.25);
    
    //size
    fill(darkblue);
    if(difficultytmp==0)
      text("easy", b*1.5, a*7.25);
    else if(difficultytmp==1)
      text("normal", b*1.5, a*7.25);
    else if(difficultytmp==2)
      text("hard", b*1.5, a*7.25);
    else
      text("extreme", b*1.5, a*7.25);
      
    
    //>
   if(overRect(b*1.8, a*7, b*0.2, a/2)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b*1.8, a*7, b*0.2, a/2, 20);
    fill(white);
    text(">", b*1.9, a*7.25);
    
    
    //keyboard
    
    if(overRect(b, a*8, rectW, rectH)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*8, rectW, rectH, 20);
    fill(white);

    if(mode==true){
      text("Mode: mouse", width/2, a*8+rectH/2);
    }
    else{
      text("Mode: keyboard", width/2, a*8+rectH/2);
    }
    
    
    //APPLY
   if(overRect(b, a*9, rectW, rectH)==true){  
      fill(darkblue);
      stroke(darkblue);
    }
    else{
      fill(blue);
      stroke(blue);
    }
    rect(b, a*9, rectW, rectH, 20);
    fill(white);
    text("APPLY", width/2, a*9+rectH/2);

    //Back.............................
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


  
  void myMousePressed() {

   
    if (overRect(b, 0, rectW, rectH)==true){
      click.play();
      if(specialCatchMode==true){
        specialCatchMode=false;
      }
      else{
        specialCatchMode=true;
      }
    }
    else if (overRect(b, a, rectW, rectH)==true){    //Music On/Off
      click.play();
      if(musicOn==true){
        musicOn=false;
        song1.pause();
      }
      else{
        musicOn=true;
        song1.play();
      }
    }
    //-
   else if (overRect(b, a*3, b*0.2, a/2)==true){
     if(volume>0){
       volume=volume-10;
       song1.amp(float(volume)/100);
     }
   }
   //+
   else if (overRect(b*1.8, a*3, b*0.2, a/2)==true){
     if(volume<100){
       volume=volume+10;
       song1.amp(float(volume)/100);
     }
   }
   
   //<1
   else if (overRect(b, a*5, b*0.2, a/2)==true){
     if(sizetmp>0)
       sizetmp=(sizetmp-1)%4;
     else
       sizetmp=3;
   }
   //>1
   else if (overRect(b*1.8, a*5, b*0.2, a/2)==true){
     sizetmp=(sizetmp+1)%4;
   }
   
   //<2
   else if (overRect(b, a*7, b*0.2, a/2)==true){
     if(difficultytmp>0)
       difficultytmp=(difficultytmp-1)%4;
     else
       difficultytmp=3;
   }
   //>2
   else if (overRect(b*1.8, a*7, b*0.2, a/2)==true){
     difficultytmp=(difficultytmp+1)%4;
   }
   //mode
   else if (overRect(b, a*8, rectW, rectH)==true){
      click.play();
      if(mode==true){
        mode=false;
        //song1.pause();
      }
      else{
        mode=true;
        //song1.play();
      }
    }
   //apply
   else if (overRect(b, a*8, rectW, rectH)==true){
     difficulty=difficultytmp;
     size=sizetmp;
     if(size==0)
       surface.setSize(500,500*6/7);
     else if(size==1)
       surface.setSize(700,600);
     else if(size==2)
       surface.setSize(900,900*6/7);
     else
       surface.setSize(1100,1100*6/7);
     init();
     
     
   }
   
    
    //Back button
   if(overCircle(50,50,50)==true){
     click.play();
     homeB=true;
     settingsB=false;
     sizetmp=size;
   }
  }
  

  
}
