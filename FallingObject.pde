// klasa koja opisuje padajući sastojak
class FallingObject{
  int width;
  int height;
  float posX; // x koordinata
  float posY; // y koordinata
  int index; // broj za ucitavanje slike
  int redniBroj; // identifikator
  
  FallingObject(int i, float x, int r){
    width = objectImages[i].width;
    height = objectImages[i].height;
    posX = x;   
    posY = dispenser.height;
    index = i;
    redniBroj = r;
  }

  FallingObject(){}
}
