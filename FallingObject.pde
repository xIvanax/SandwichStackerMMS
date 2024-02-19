class FallingObject{

  int width;
  int height;
  float posX;
  float posY;
  int index; //za ucitavanje slike
  int redniBroj;
  
  FallingObject(int i, float x, int r){
    width=objectImages[i].width;
    height=objectImages[i].height;
    posX=x;   
    posY=dispenser.height;
    index=i;
    redniBroj=r;
  }
    FallingObject(){}
  
  
}
