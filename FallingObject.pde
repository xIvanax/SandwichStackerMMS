class FallingObject{

  int width;
  int height;
  float posX;
  float posY;
  int points;
  boolean bomb;
  int index;
  
  FallingObject(int i, float x, int pts, boolean bmb){
    width=objectImages[i].width;
    height=objectImages[i].height;
    posX=x;   
    posY=dispenser.height;
    points=pts;
    bomb=bmb;
    index=i;
  }
    FallingObject(){
  }
  
  
}
