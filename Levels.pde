void gg() {
  background (0); 
  MainObj.setColor(0, 200,200); 
  if (fingerIndex!=null) {
    MainObj.drawRect (fingerIndex.getPosition().x, fingerIndex.getPosition().y);
  }
  fill (255); 
  text ("Lol u suck", width/2, height/2);
}

void Opening() {
  fill(0);
  text("Welcome to the game", 500, 500);
  for (Hand hand : leap.getHands ()) {
    for (Finger f : hand.getFingers()) {        // Bone structure for testing
      f.drawBones();
      f.drawJoints();
    }
  }
  eSize=map(grabR, 0, 1, 20, 60);
  if (fingerIndex!=null)
    MainObj.drawRect (fingerIndex.getPosition().x, fingerIndex.getPosition().y);    // GOES IN EVERY LEVEL
  if (g<250) {     // This whole thing just makes the background green based off xPos
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


  // TESTING
  item TestBox = new item(100, 100); 
  TestBox.setColor (0,200,200); 
  TestBox.drawRect(200, 200);
}



public void level1() {
  fill(0);
  if (levelTime<400) {
    text("Good luck! No help from us", 500, 500);
  } else {
    fill(0);
    text("Level 1", 500, 500);
    MainObj.drawRect(fingerIndex.getPosition().x, fingerIndex.getPosition().y);
    BA.drawRect(375, 225);
    BB.drawRect(725, 175);
    BC.drawRect(575, 600);
    BD.drawRect(250, 700);
    BE.drawRect(775, 650);
    BF.drawRect(500, 925);
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
