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

public void level1() {
  fill(0);
  if (levelTime<400) {
    text("Good luck! No help from us", 500, 500);
  } else {
    fill(0);
    text("Level 1", 500, 500);
    fill(0, 255, 0);
    rect(20, 20, 40, 40);
    //if(inBoundaries(currXR, currYR, 0, 20, 0, 0))
  }
  levelTime++;
}

public void level2() {
  
}

public void level3() {
  
}

public void level4() {
  
}

public void level5() {
  
}