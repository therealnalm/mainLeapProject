public class item{

  private float objWidth, objHeight;
  private PImage img;
  
  public item(float oWidth, float oHeight, PImage TheImage){
    objWidth=oWidth;
    objHeight=oHeight;
    img=TheImage;
  }
  
  public void drawIt(float x, float y){
    imageMode(CENTER);
    image(img,x,y);
  }
  
  public boolean inBoundaries(int x, int y, int xLeft, int xRight, int yTop, int yBottom){
     return ((x-objWidth/2>xLeft)&&(x+objWidth/2<xRight)&&(y-objHeight/2>yTop)&&(y+objHeight/2<yBottom));
  }
  
  
  
}
