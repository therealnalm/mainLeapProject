public class Obj {
  boolean plyr, xCollide = false, yCollide = false;
  int wid, hei, xLoc, yLoc, R, G, B; 
  
  public Obj (boolean play) {
    plyr = play; 
  }
  
  public void setDimens (int xLen, int yLen) {
    wid = xLen;
    hei = yLen; 
  }
  
  public void setLoc (int x, int y) {
    xLoc = x;
    yLoc = y; 
  }
  
  public int getX () {
    return xLoc;
  }
  public int getY () {
    return yLoc;
  }
  public int getWidth() {
    return wid;
  }
  public int getHeight () {
    return hei;
  }
  
  public void setColor (boolean r, boolean g, boolean b) {
    if (r) {
      R = 200; 
    }
    if (g) {
      G = 200; 
    }
    if (b) {
      B = 200; 
    }
  }
  
  
  public void make () {
    rectMode (CENTER);
    fill (R, G, B); 
    
    rect (xLoc, yLoc, wid, hei); 
    
    /*if (xLoc - wid/2 <= player.getX() + player.getWidth()/2 && xLoc + wid/2 >= player.getX() - player.getWidth()/2) {
      xCollide = true; 
    }
    
    if (yLoc - hei/2 <= player.getY() + player.getHeight()/2 && yLoc + hei/2 >= player.getY() - player.getHeight()/2) {
      yCollide = true; 
    }
    */
    if (xCollide && yCollide) {
      gameOver(); 
    }
  }
  
}
