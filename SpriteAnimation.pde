public class spriteAnim {
  /* NOTES:
  - All set functions must be done in the void setup() for each sprite, NOT DRAW IT WILL FUCK SHIT UP
  */
  private PImage sprite; 
  private int frmWidth, frmHeight, frmAmt, frmNum; 
  
  public spriteAnim (String fileName) {
    
    sprite = loadImage (fileName);                     // Must remember to upload image file to main method
    frmNum = 0;
    
  }
  
  public void setDimens (int x, int y) {
    frmWidth = x;
    frmHeight = y;
  }
  
  public void setFrms (int amt) {
    frmAmt = amt; 
  }
  
  
  public void makeIt (float x, float y, int frmRate) {       //Now it finds the frame of the sprite and draws it at x and y
    if (frmWidth == 0 || frmHeight == 0) {
      throw new IllegalArgumentException("Do setDimens()"); 
    }
    
    if (frameCount % frmRate == 0) { // ALTERNATIVE: create a counter for this method that just increases each cycle
      frmNum++;
      frmNum %= frmAmt; 
    }
    // TEST ZONE
    /*
    text (frmWidth, width/2 + width/4, height/2);
    text (frmHeight, width/2 + width/4, height/2 - 100);
    text (frmAmt, width/2 + width/4, height/2 + 100);
    text (frmNum, width/2 + width/4, height/2 + 200);
    */
    
    PImage currFrame = sprite.get (frmNum * frmWidth, 0, frmWidth, frmHeight); 
    imageMode(CENTER);
    image(currFrame,x,y);
    
    
  }
  
  public boolean imgInBoundaries(float x, float y, int xLeft, int xRight, int yTop, int yBottom){ //this is essentially a lame hitbox detector. Won' allow any edges of an img to touch the walls
     return ((x-frmWidth/frmAmt/2>xLeft)&&(x+frmWidth/frmAmt/2<xRight)&&(y-frmHeight/frmAmt/2>yTop)&&(y+frmHeight/frmAmt/2<yBottom)); //checks all 4 sides of the img to be within the 4 given parameters
  }
  
  
}
