void gg() {
  background (0); 
  MainObj.setColor(125, 125, 125); 
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
  eSize=gray;
  if (fingerIndex!=null)
    MainObj.drawRect (fingerIndex.getPosition().x, fingerIndex.getPosition().y);    // GOES IN EVERY LEVEL
  if (gray<120) {     // This whole thing just makes the background green based off xPos
    gray=map(currXR, 0, 1000, 0, 125);
  } else {
    gray=map(currXR, 200, 1000, 255, 130);
  }
  if (gray>250) {
    level++;
    levelTime=0;
    gray=255;
  }



  // TESTING
  item TestBox = new item(100, 100); 
  TestBox.setColor (0, 200, 200); 
  TestBox.drawRect(200, 200);
}



public void level1() {

  MainObj.drawRect(fingerIndex.getPosition().x, fingerIndex.getPosition().y);

  if (levelTime<400) {
    fill(0);
    text("Good luck! No help from us", 500, 500);
  } else {
    fill(0);

    BA.drawRect(375, 225);
    BB.drawRect(725, 175);
    BC.drawRect(575, 550);
    BD.drawRect(250, 700);
    BE.drawRect(775, 650);
    BF.drawRect(500, 775);
    BGoal.drawRect(950, 100);
  }
  fill(0);
  text("Level 1", 500, 400);
  levelTime++;
}


public void level2() {
  L2y1 += L2dir1;    // 
  L2y2 += L2dir2; 
  MainObj.drawRect (fingerIndex.getPosition().x, fingerIndex.getPosition().y);   
  item obs1 = new item (50, 200); 
  item obs2 = new item (50, 200); 
  item goal = new item (200, 100);  
  goal.isGoal(); 

  obs1.drawRect(300, L2y1); 
  obs2.drawRect(600, L2y2); 
  BGoal.drawRect(50,700); 

  if (obs1.getY() - obs1.getHeight()/2 < 0 || obs1.getY() + obs1.getHeight()/2 > height) {
    L2dir1*=-1;
  }
  if (obs2.getY() - obs2.getHeight()/2 < 0 || obs2.getY() + obs2.getHeight()/2 > height) {
    L2dir2*=-1;
  }
  fill(0);
  text("Level 2", 500, 400);
}

public void level3() {
}

public void level4() {
}

public void level5() {
}
