class Highscores{
  String[] lines;
  int[] scores;
  String[] dates;
  int a,b;
   
  Highscores(){
    a=height/15;
    b=width/10;
  }
  
  void myDraw(){
    
    background(background1);

    textAlign(CENTER);
    textSize(a);
    fill(color(darkblue));
    text("Top 10", width/2, a*2);
    

    textAlign(CENTER,CENTER);
    textSize(a/2);
    fill(color(darkblue));
    text("position", b*2.5 ,a*3.5);
    text("score", b*4.5, a*3.5);
    text("date", b*7, a*3.5);
    stroke(color(darkblue));
    line(b, a*4, b*9, a*4);
    line(b, a*4-2, b*9, a*4-2);
    
    //fill the score table
    textAlign(CENTER, CENTER);
    for(int i = 0; i<10 && i<lines.length;++i){
      fill(color(darkblue));
      text((i+1)+". ", b*2.5 ,a*(i+4.5));
      fill(color(blue));
      text(scores[i], b*4.5, a*(i+4.5));
      text(dates[i], b*7, a*(i+4.5));
      fill(color(darkblue));
      line(b, a*(i+5), b*9, a*(i+5));
    }
    //back button
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
    dates = new String[lines.length];
    
    for(int i = 0; i < lines.length  ; i++){
      String[] spl = split(lines[i]," ");
      scores[i] = Integer.valueOf(spl[0]);
      dates[i] = spl[1];

    }
    //bubble sort
    for(int i = 0; i < lines.length -1  ; i++)
    {
      for(int j = 0; j < lines.length - i-1 ; j++){
         if( scores[j] <= scores[j+1]){
           String temp = dates[j];
           dates[j] = dates[j+1];
           dates[j+1] = temp;
           int tmp = scores[j];
           scores[j] = scores[j+1];
           scores[j+1] = tmp;
         }
      }
       
    }

  }
}
