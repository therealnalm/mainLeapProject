public class item {

  private float objWidth, objHeight, x, y, r, g, b;
  public float pX, pY, pW, pH;
  boolean isPlayer = false, xCollide = false, yCollide = false; 

  public item(float oWidth, float oHeight) {
    objWidth=oWidth;
    objHeight=oHeight;
    r=100;
    g=100;
    b=100;
    pX=100;
    pY=100;
  }

  public void setPlayer () {
    isPlayer = true; 
    pW= objWidth;
    pH= objHeight;
  }

  public void setColor(float red, float green, float blue) {
    r = red; 
    g = green; 
    b = blue;
  }

  public void setDims(float x, float y) {
    objWidth=x;
    objHeight= y;
  }

  public void drawRect(float X, float Y) {
    rectMode(CENTER);
    x = X;
    y = Y;
    fill(r, g, b);
    rect(x, y, objWidth, objHeight);
    if (isPlayer) {
      pX=X;
      pY=Y;
    } else {
      if (x - objWidth/2 <= pX + pW/2 && x + objWidth/2 >= pX - pW/2) {
        xCollide = true;
      } else {
        xCollide=false;
      }

      if (y - objHeight/2 <= pY + pH/2 && y + objHeight/2 >= pY - pH/2) {
        yCollide = true;
      } else {
        yCollide=false;
      }

      if (xCollide && yCollide) {
        gameOver();
      }
    }
  }

  public float getX () {
    return x;
  }
  public float getY () {
    return y;
  }
  public float getWidth() {
    return objWidth;
  }
  public float getHeight () {
    return objHeight;
  }

  /*public boolean inBoundaries(int X, int Y, int xLeft, int xRight, int yTop, int yBottom){
   return ((x-objWidth/2>xLeft)&&(x+objWidth/2<xRight)&&(y-objHeight/2>yTop)&&(y+objHeight/2<yBottom));
   } */
}
