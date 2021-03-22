int END_FRAME = 450;

//PVector[] mPosAnim = new PVector[450];
JSONArray jsonArray = new JSONArray();
;
int cFrame = 1;
PImage[] img = new PImage[451] ;
void setup() {
  size(1920, 1080);
  background(255, 0, 0);
  frameRate(30);
  for (int i =1; i<END_FRAME+1; i++) {
    String num = String.format("%04d", i);
    img[i] = loadImage("data/seq/"+ "img_" + num + ".png");
  }
}


void draw() {
  if (cFrame == END_FRAME) {
    exit();
  } else {
    background(0);
    image(img[cFrame], 0, 0);
    text(frameCount, 10, 10);
    text("This Frame:::"+cFrame, 10, 30);
    stroke(255);
    ellipse(mouseX, mouseY, 10, 10);
  }
}

void mousePressed() {
  JSONArray pos = new JSONArray();
  fill(255);
  ellipse(mouseX, mouseY, 10, 10);
  pos.setInt(0, mouseX);
  pos.setInt(1, mouseY);
  jsonArray.setJSONArray(cFrame, pos);
  println(frameCount, "::", "(x,y) =", mouseX, ",", mouseY); 
  cFrame++;
}

void keyPressed() {
  if (key == ' ') {
    JSONArray pos = new JSONArray();
    pos.setInt(0, 0);
    pos.setInt(1, 0); 
    jsonArray.setJSONArray(cFrame, pos);
    cFrame++;
  } else {
    if (cFrame>0) {
      cFrame--;
    }
  }
}

void exit() {
  jsonArray.remove(0);
  saveJSONArray(jsonArray, "keyFrame.json");
}
