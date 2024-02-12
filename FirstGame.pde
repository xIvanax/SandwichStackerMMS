class FirstGame{
  int rnd; //random odabir padajućeg objekta
  int lives; //broj života
  FallingObject obj;
  ArrayList<FallingObject> objects, fallingIngredients, Tower;
  ArrayList<Highscore> highscores;
  int time1,time2,timespeed1,timespeed2;
  float time,low,up;
  float secondsToFall;
  float durationOfBiggerBottomBun = 0, durationOfProtection = 0;
  float timeBottomBunResized = 0, timeProtectionStarted = 0;
  int originalBottomBunWidth, originalBottomBunHeight;
  int dispenserX;
  PImage background2 = loadImage("background2.jpg");
  PImage powerUp;
  int powerUpX;
  int powerUpY;
  int slowdown = 0; //usporavanje zbog puza
  int slowdownTimer = 0; //timer usporavanja
  int slowdownCounter = 0; //kolko puzeva je trenutno aktivno
  int sandwichHeight;
  int  numIngredients;
  int[] goalSandwich = new int[10];
  
  boolean moveLeft, moveRight, dropIngredient;
  int stepSize; //pomak dispensera
  int trenutniPowerUp = -1;
  
  int gameWidth = width - width/2 + 70;
  
  int TowerTopX, TowerTopY, bottomBunX, bottomBunY; // lokacija tornja i bottomBun-a
  int orientation; //u kojem smjeru trenutno bottomBun ide
  int speed; //brzina bottomBuna
  int speedIng; //brzina pada sastojka
  
  int nextIngredient; //sljedeći sastojak koji će pasti
  int byy = 0;
  int ayy;
      
  int lastSpaceKeyPressTime; //kad je zadnji put pritisnut space
  boolean ingredientDropped; 
  
  FirstGame(){
    lives=3;
    objects = new ArrayList<FallingObject>(); // padajući sastojci
    Tower = new ArrayList<FallingObject>(); // toranj sastojaka na bottomBun-u
    highscores = new ArrayList<Highscore>();
    time1=0;
    time2=0;
    timespeed1=0;
    timespeed2=0;
    time=1000;
    low=700;
    up=1500;
    secondsToFall=3;
    originalBottomBunWidth = bottomBun.width;
    originalBottomBunHeight = bottomBun.height;
    dispenserX=(width-width/6)/2-dispenser.width/2;
    dispenser.resize(dispenser.width, 50);
    
    moveLeft = moveRight = dropIngredient = false;
    lastSpaceKeyPressTime = 0;
    ingredientDropped = false;
    stepSize = 5;
    
    TowerTopX = bottomBunX = gameWidth/2 + bottomBun.width/2;
    TowerTopY = bottomBunY = height-bottomBun.height;
    orientation = 1; // 1 za desno, -1 za lijevo
    speed = 5;
    speedIng=4;
    
    numIngredients = 12;
    
    generateRandomSandwich();
    GenerateNewIngredient();
  }
  
  void myDraw(){
      time2=millis();
      timespeed2=millis();
      
      background2.resize(width, height);
      background(background2);
      imageMode(CORNER);
      //score
      fill(255);
      textSize(20);
      textAlign(RIGHT);
      fill(color(color(0, 0, 0)));
      text("SCORE: "+score, width-30, 30);
      //lives
      for(int i=0; i<lives; i++){
        image(heart, width-35*i-50, 50);
      }
      // info panel
      NextIngredientInfo();
      drawGoalSandwich();
      
      //dispenser
      if (moveLeft && dispenserX > 0) {
        dispenserX -= stepSize;
      } else if (moveRight  && dispenserX < gameWidth) {
        dispenserX += stepSize;
      }
      image(dispenser,dispenserX,0);
      
      //pomicanje bottomBun-a
      if(bottomBunX >= width - 280){
        orientation = -1;
      }else if(bottomBunX <= 0){
        orientation = 1;
      }
      
      bottomBunX += orientation*speed;
      TowerTopX = bottomBunX;

      image(bottomBun, bottomBunX, height-bottomBun.height);
      
      if (dropIngredient && !ingredientDropped && millis() - lastSpaceKeyPressTime >= 500) {
        obj = new FallingObject(nextIngredient, dispenserX, 1, false);
        objects.add(obj); 
        GenerateNewIngredient();
        dropIngredient = false;
        ingredientDropped = true; // Set flag to indicate ingredient has been dropped
      }
      //generiranje powera
      ;
      if(byy == 0){
        ayy = int(random(0,100));
      }
        //print(ayy)
        if(ayy == 1 && byy == 0){
          byy = 300;
          ayy = 0;
          print("oof");//generacija poweruppa
        
          int rnd = (int)random(0,3);
          if(rnd == 0){
            PImage powerUpImage = objectImages[26];
            powerUp = powerUpImage.get();
            powerUp.resize(90, 90); // Set size of powerupp
            trenutniPowerUp = 0;
            powerUpX = (int) random(0,540);
            powerUpY = (int) random(60,490);
          } 
          if(rnd == 1){
            PImage powerUpImage = objectImages[23];
            powerUp = powerUpImage.get();
            powerUp.resize(90, 90); // Set size of powerupp
            trenutniPowerUp = 1;
            powerUpX = (int) random(0,540);
            powerUpY = (int) random(60,490);
          } 
          if(rnd == 2){
            PImage powerUpImage = objectImages[17];
            powerUp = powerUpImage.get();
            powerUp.resize(90, 90); // Set size of powerupp
            trenutniPowerUp = 2;
            powerUpX = (int) random(0,540);
            powerUpY = (int) random(60,490);
          } 
          
        }
        if(byy>0){
          byy--;
          //print(byy + "\n");
          if(byy == 0){
            print("eef");//uklanjanje poweruppa
            trenutniPowerUp = -1;
          }
        }
      //powerUpX = 540; //max value
      //powerUpY = 490; //max value
      //powerUpY = 60; //min value
      if(trenutniPowerUp != -1){
        image(powerUp, powerUpX, powerUpY);
      }
       
      //pomicanje cijelog sendviča
      TowerTopX -= speed * orientation;
      for(int i=0; i<Tower.size(); i++){
        obj = Tower.get(i);
        PImage ingredientImage = objectImages[obj.index];
        ingredientImage.resize(bottomBun.width, bottomBun.height);
        obj.posX += orientation*speed;
        image(ingredientImage,obj.posX,obj.posY);
      }
      // ispitivanje sudbine padajućeg sastojka
      for (int i = objects.size()-1; i >= 0; i--) {
        obj = objects.get(i);
        
        PImage ingredientImage = objectImages[obj.index];
        ingredientImage.resize(bottomBun.width, bottomBun.height);

        
        // provjera kolizije sastojka koji pada s powerUpp-om
        if (trenutniPowerUp!=-1 && obj.posX + ingredientImage.width >= powerUpX && obj.posX <= powerUpX + powerUp.width && obj.posY + ingredientImage.height >= powerUpY && obj.posY <= powerUpY) {
          if(trenutniPowerUp == 0){
            if(lives<4){
              lives++;
            }
          }
          if(trenutniPowerUp == 1){
            score+=15;
          }
          if(trenutniPowerUp == 2){
            slowdown++;
            slowdownCounter++;
            slowdownTimer = 100;
            speed -= 2;
          }
          trenutniPowerUp = -1;
        }
        slowdownTimer--;
        if(slowdownTimer == 0){
          speed += slowdownCounter*2;
          slowdownCounter = 0;
        }
        
        // provjera kolizije sastojka koji pada s bottomBun-om
        if (obj.posX + ingredientImage.width >= TowerTopX && obj.posX <= TowerTopX + bottomBun.width && obj.posY + ingredientImage.height >= TowerTopY && obj.posY <= TowerTopY) {
            // podesavanje visine sastojka
            obj.posY = TowerTopY - ingredientImage.height;
            // ako smo potvrdili koliziju s bottomBun-om, provjeravamo je li sastojak ispravan
            if (obj.index == goalSandwich[Tower.size()] || (Tower.size() == sandwichHeight - 2 && obj.index == 12)) {
                // ako je sastojak ispravan dodam ga na Tower
                Tower.add(obj);
                
                TowerTopY -= ingredientImage.height;
                TowerTopX = (int)obj.posX;
                // provjera je li zavrsen sendvic
                if (Tower.size() == sandwichHeight - 1 && obj.index == 12) {
                    score+= 10;
                    Tower.clear();
                    TowerTopX = bottomBunX;
                    TowerTopY = bottomBunY;
                }
            } else {
                // neispravan sastojak pao na bottomBun, smanjim broj zivota
                lives--;
                if(lives == 0)
                  setGameOver();
            }
            // micem sastojak iz liste padajucih
            objects.remove(i);
        } else {
            // If no collision, continue falling
            obj.posY += speedIng;
            image(ingredientImage, obj.posX, obj.posY);
            if(obj.posY > height)
              objects.remove(i);
        }
      }
      
        if(difficulty==0){
          if(timespeed2-timespeed1>2000){
            if(secondsToFall>1.2)
              secondsToFall-=0.02;
            if(low>600)
              low-=10;
            if(up>1000)
              up-=10;
            timespeed1=timespeed2;
          }
        }
        else if(difficulty==1){
          if(timespeed2-timespeed1>1000){
            if(secondsToFall>0.7)
              secondsToFall-=0.02;
            if(low>200)
              low-=5;
            if(up>600)
              up-=10;
            timespeed1=timespeed2;
          }
        }
        else if(difficulty==2){
          if(timespeed2-timespeed1>1000){
            if(secondsToFall>0.6)
              secondsToFall-=0.05;
            if(low>200)
              low-=10;
            if(up>600)
              up-=50;
            timespeed1=timespeed2;
          }
        }
        else if(difficulty==3){
          if(timespeed2-timespeed1>1000){
            if(secondsToFall>0.7)
              secondsToFall-=0.07;
            if(low>100)
              low-=10;
            if(up>300)
              up-=70;
            timespeed1=timespeed2;
          }
        }
  }
  
  
  void setGameOver(){ 
    //appendTextToFile("scores.txt", score + " "+day()+"/"+month()+"/"+year()+"-"+hour()+":"+minute()+":"+second() );
    
    Highscore highscore = new Highscore();
    highscores =  highscore.loadHighscores();
    if(isHighScore(score, highscores)){
      isHighscore = true;
    }
    
    firstGameB=false;
    gameOverB=true;
  }

  void myMousePressed() {
    
    if(overCircle(30,height-30,50)==true){
       homeB=true;
       firstGameB=false;
       firstGame = new FirstGame();
       score=0;
     }
  }
  
  void myKeyPressed() {
    if (keyCode == UP) { //status report
      print(speed+ "\n"); }
    if (keyCode == LEFT) {
      moveLeft = true;
    }else if (keyCode == RIGHT) {
      moveRight = true;
    }else if (keyCode == ' ') {
      lastSpaceKeyPressTime = millis(); // Update the time of the last space key press
      dropIngredient = true; // Set the flag to drop the ingredient
      ingredientDropped = false; // Reset flag to indicate no ingredient has been dropped yet
    }
    
  }
  
  void myKeyReleased() {
    if (keyCode == LEFT) {
      moveLeft = false;
    }else if (keyCode == RIGHT) {
      moveRight = false;
    }else if(keyCode == ' '){
      //lastSpaceKeyPressTime = millis();
    }
  }
  
  void generateRandomSandwich() {
    // Random sandwich height (set to 10)
    sandwichHeight = int(random(2, 10)); // Minimum is 2, representing bottomBun + topBun
  
    for (int i = 0; i < sandwichHeight - 2; i++) {
      int randIngredient = int(random(1, numIngredients)); // Random ingredient excluding topBun
      goalSandwich[i] = randIngredient;
    }
    
    goalSandwich[sandwichHeight-1] = 12;
  }
  
  void drawGoalSandwich(){
    // Set bottomBun
    PImage bottomBunImage = loadImage("bottomBun.png");
    bottomBunImage.resize(width / 7, 0);
    PImage bottomBun = bottomBunImage.get();
    bottomBun.resize(width / 7, 0);
    image(bottomBun, width - width/6, height-bottomBun.height);
    
    int xOfNextIngredient = height-2*bottomBun.height+10; //dodala sam ovaj 10 kako bi ostalo mjesta za prikaz sljedeceg sastojka
    for (int i = 0; i < sandwichHeight - 2; i++) {
      PImage ingredientImage = objectImages[goalSandwich[i]];
      PImage ingredient = ingredientImage.get();
      ingredient.resize(bottomBun.width, bottomBun.height);
      image(ingredient, width - width/6, xOfNextIngredient);
      xOfNextIngredient -= ingredient.height-10; // Increment x position for next ingredient
    }
    
    // Set topBun
    PImage topBunImage = objectImages[12];
    PImage topBun = topBunImage.get();
    topBun.resize(bottomBun.width, bottomBun.height); // Set size of topBun
    image(topBun, width - width/6, xOfNextIngredient);
  }
  
  void GenerateNewIngredient(){
     nextIngredient = int(random(1, numIngredients));
     int prob = int(random(1, 3)); //vjerojatnost da se dobije sastojak koji treba (pretpostavljam da se generira broj iz [1,3>; to jest 30%)
     if (prob == 2){
       nextIngredient = goalSandwich[Tower.size()];
       if(nextIngredient == 0)
         nextIngredient = 12; //ne znam zakaj, al kad treba top bun, daje bombu, pa ovo to fixa
   }
  }
  
  void NextIngredientInfo(){
    PImage nextIngredientImage = objectImages[nextIngredient];
    PImage NextIngredient = nextIngredientImage.get();
    NextIngredient.resize(bottomBun.width, bottomBun.height);
    image(NextIngredient, width - width/6, 90); 
  }
  
  //Provjera je li igračev rezultat bolji od najgoreg rezultata na listi najboljih rezultata.
  boolean isHighScore(int score, ArrayList<Highscore> topScores) {
    if(score == 0){
      return false;
    }
    if(topScores.isEmpty()){
      return true;
    }
    
    int minScore = topScores.get(0).scoreValue;
    
    // Find the minimum score among the top scores
    for (int i=1; i<topScores.size(); i++) {
      if (topScores.get(i).scoreValue < minScore) {
        minScore = topScores.get(i).scoreValue;
      }
    }
    
    if (score > minScore) {
      return true;
    }
    
    return false;
    
  }


}
