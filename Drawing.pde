
public class item{

  private float objWidth, objHeight, r, g, b;

  public item(float oWidth, float oHeight){
    objWidth=oWidth;
    objHeight=oHeight;
    r=0;
    g=0;
    b=0;
  }

  public void setColor(float red, float green, float blue){
    r=red;
    g=green;
    b=blue;
  }
  
  public void setDims(float x, float y){
  objWidth=x;
  objHeight= y;
  }
  
  public void drawRect(float x, float y, float r, float g, float b){
    rectMode(CENTER);
    fill(r,g,b);
    rect(x,y,objWidth, objHeight);
  }

  public boolean inBoundaries(int x, int y, int xLeft, int xRight, int yTop, int yBottom){
     return ((x-objWidth/2>xLeft)&&(x+objWidth/2<xRight)&&(y-objHeight/2>yTop)&&(y+objHeight/2<yBottom));
  }



<<<<<<< HEAD
}
=======
// This class was made obsolete by Sprite Animation
>>>>>>> 650eee4660ed7f9b338bcb3e351bd5eee2b56213
