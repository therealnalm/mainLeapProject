public class item{

  private float objWidth, objHeight, x, y, r, g, b;
  boolean isPlayer = false, xCollide = false, yCollide = false; 

  public item(float oWidth, float oHeight){
    objWidth=oWidth;
    objHeight=oHeight;
    r=0;
    g=0;
    b=0;
  }
  
  public void setPlayer () {
    isPlayer = true; 
  }

  public void setColor(boolean red, boolean green, boolean blue){
    if (red) {
      r = 200; 
    }
    if (green) {
      g = 200; 
    }
    if (blue) {
      b = 200; 
    }
  }
  
  public void setDims(float x, float y){
  objWidth=x;
  objHeight= y;
  }
  
  public void drawRect(float X, float Y){
    rectMode(CENTER);
    x = X;
    y = Y;
    fill(r,g,b);
    rect(x,y,objWidth, objHeight);
    if (isPlayer == false) {
      if (x - objWidth/2 <= MainObj.getX() + MainObj.getWidth()/2 && x + objWidth/2 >= MainObj.getX() - MainObj.getWidth()/2) {
        xCollide = true; 
      }
      
      if (y - objHeight/2 <= MainObj.getY() + MainObj.getHeight()/2 && y + objHeight/2 >= MainObj.getY() - MainObj.getHeight()/2) {
        yCollide = true; 
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
