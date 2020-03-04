import de.voidplus.leapmotion.*;

LeapMotion leap;
float currXR, currYR, rollR, pitchR, yawR, grabR, currXL, currYL, rollL, pitchL, yawL, grabL, eSize, r, g, b, gray, objWidth, objHeight1, pX, pY, pW, pH;;
int level, levelTime;
PVector rPointer, fingerPosition;
boolean RLeftFifth, RRightFifth, RTopThird, RBottomThird, LLeftThird, LRightThird, LTopThird, LBottomThird;

// LEVEL 2 VARIABLES
float L2dir1, L2dir2, L2y1, L2y2; 

Finger  fingerIndex;
item MainObj, BA, BB, BC, BD, BE, BF, BGoal; //b=blocks A-E used in level 1 as boundaries

 
// Obj player; 


void setup() {
  size(1000, 800);
  background(255);
  level=0;
  eSize=40;
  leap = new LeapMotion(this);
  r=30;
  g=30;
  b=30;
  MainObj = new item(30,30);
  MainObj.setPlayer(); 
  //Setting Calculated Lengths and heights of the blocks. X and Y coordinates are defined when they get drawn
  BA = new item (450,450);
  BB = new item (250,350);
  BC = new item (150,200);
  BD = new item (200,300);
  BE = new item (150,400);
  BF = new item (400,50);
  BGoal= new item (50,50);
  BGoal.isGoal();
  BGoal.setColor(0,255,0);
  gray= 0;

  // LEVEL 2 VARIABLES
  L2dir1 = 10; 
  L2dir2 = -10; 
  L2y1 = height/2;
  L2y2 = height/2; 
}


boolean RIsLeftThird() {
  return (currXR<width/3);
}

/* boolean InBoundaries(a, b, c, d) {
  return();
} */


void draw() {
  textSize(40);
  textAlign(CENTER);
  background (gray); 
  println("Test");
  

  int fps = leap.getFrameRate(); 
  for (Hand hand : leap.getHands ()) {


    // ==================================================
    // 2. Hand

    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    PVector handStabilized     = hand.getStabilizedPosition();
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition();
    float   sphereRadius       = hand.getSphereRadius();

    // --------------------------------------------------
    // Drawing
    //hand.draw();


    // ==================================================
    // 3. Arm

    if (hand.hasArm()) {
      Arm     arm              = hand.getArm();
      float   armWidth         = arm.getWidth();
      PVector armWristPos      = arm.getWristPosition();
      PVector armElbowPos      = arm.getElbowPosition();



      if (handIsRight) {
        currXR=handPosition.x;
        currYR=handPosition.y;
        rollR=handRoll;
        yawR=handPitch;
        pitchR=handYaw;
        grabR= hand.getGrabStrength();
        text(gray, 40, 60);
      } else if (handIsLeft) {
        currXL=handPosition.x;
        currYL=handPosition.y;
        rollL=handRoll;
        yawL=handPitch;
        pitchL=handYaw;
        grabL= hand.getGrabStrength();
      }
    }


    // ==================================================
    // 4. Finger

    Finger  fingerThumb        = hand.getThumb();

    fingerIndex                = hand.getIndexFinger();

    Finger  fingerMiddle       = hand.getMiddleFinger();

    Finger  fingerRing         = hand.getRingFinger();

    Finger  fingerPink         = hand.getPinkyFinger();


    for (Finger finger : hand.getFingers()) {

      int     fingerId         = finger.getId();
      fingerPosition   = finger.getPosition();
      PVector fingerStabilized = finger.getStabilizedPosition();
      PVector fingerVelocity   = finger.getVelocity();
      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();
      RRightFifth=(fingerIndex.getPosition().x>800);
      RLeftFifth=(fingerIndex.getPosition().x<200);
    }
  }

  //put level manuevering here
  if (level == -1) {
    gg(); 
  } else if (level==0) {
    Opening();
  } else if (level==1) {
    level1();
  } else if (level==2) {
    level2();
  } 

  levelTime++;
}
