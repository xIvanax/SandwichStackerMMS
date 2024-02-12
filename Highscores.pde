class Highscores{
  String[] lines;
  int[] scores;
  String[] names;
  int a,b;
   
  Highscores(){
    a=height/15;
    b=width/10;
  }
  
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
    
    //fill the score table
    textAlign(CENTER, CENTER);
    for(int i = 0; i<5 && i<lines.length;++i){
      fill(color(0));
      text((i+1)+". ", b*2.5 ,a*(i+4.5));
      fill(color(0));
      text(scores[i], b*4.5, a*(i+4.5));
      text(names[i], b*7, a*(i+4.5));
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
//    image(leftArrow,50,50);
    
  }

  void myMousePressed() {

    //go back
   if(overCircle(50,50,50)==true){

     homeB=true;
     highscoresB=false;
   }
  }

  
  void calculate(){
    lines = loadStrings("scores.txt");
    scores = new int[lines.length]; 
    names = new String[lines.length];
    
    if (lines != null) {
      int i=0;
      for (String line : lines) {
        String[] parts = line.split(", ");
        if (parts.length >= 2) {
          names[i] = parts[0].trim();
          scores[i] = Integer.parseInt(parts[1].trim());
          i++;
        }
      }
    }
  }
}
