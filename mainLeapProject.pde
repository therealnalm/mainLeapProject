import de.voidplus.leapmotion.*;

LeapMotion leap;
float currXR, currYR, rollR, pitchR, yawR, grabR, currXL, currYL, rollL, pitchL, yawL, grabL, eSize, r, g, b, objWidth, objHeight1;
int level, levelTime;
PVector rPointer, fingerPosition;
boolean RLeftFifth, RRightFifth, RTopThird, RBottomThird, LLeftThird, LRightThird, LTopThird, LBottomThird;
Finger  fingerIndex;

void setup() {
  size(1000, 1000);
  background(255);
  level=0;
  eSize=40;
  leap = new LeapMotion(this);
  r=30;
  g=30;
  b=30;
}

void Opening() {
  textSize(40);
  textAlign(CENTER);
  fill(0);
  text("Welcome to the game", 500, 500);
  for (Hand hand : leap.getHands ()) {
    for (Finger f : hand.getFingers()) {
      f.drawBones();
      f.drawJoints();
    }
  }
  eSize=map(grabR, 0, 1, 20, 60);
  fill(0, 0, 255);
  if (fingerIndex!=null)
    ellipse(fingerIndex.getPosition().x, fingerIndex.getPosition().y, 40, eSize);

  if (g<250) {
    g=map(currXR, 0, 1000, 0, 255);
  } else if (r<250) {
    g=255;
    r=map(currXR, 1000, 200, 0, 255);
  } else {
    r=255;
    b=map(currXR, 0, 1000, 0, 255);
    if (b>250) {
      level++;
      levelTime=0;
      b=255;
    }
  }
}


void level1() {
  fill(0);
  if (levelTime<600) {
    text("Good luck! No help from us", 500, 500);
  } else {
    fill(0);
    text("Level 1", 500, 500);
    fill(0, 255, 0);
    rect(0, 0, 20, 20);
  }

  levelTime++;
}
void level2() {
}
void level3() {
}
void level4() {
}
void level5() {
}


boolean RIsLeftThird() {
  return (currXR<width/3);
}

boolean InBoundaries(a, b, c, d) {
  return(
}


void draw() {
  background(r, g, b);
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
        text("ere"+grabR, 20, 60);
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

    fingerIndex        = hand.getIndexFinger();

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
  if (level==0) {
    Opening();
  } else if (level==1) {
    level1();
  }

  levelTime++;
}
