int END_FRAME = 293;

PVector[] mPosAnim = new PVector[293];
JSONArray jsonArray = new JSONArray();;

PImage img;


void setup(){
  size(1920, 1080);
  background(0);
  
  //// Set frameRate
  frameRate(30);
  ////  set your guid picture (if you need)
  img = loadImage("data/g.png");
}


void draw(){
  background(0,0);
  image(img,0,0);
  JSONArray pos = new JSONArray();
  
  if(mousePressed){
     stroke(255);
     ellipse(mouseX,mouseY,10,10);
     point(mouseX,  mouseY);
     println(frameCount,"::","(x,y) =", mouseX,",",mouseY); 
     pos.setInt(0,mouseX);
     pos.setInt(1,mouseY);
  }else{
     pos.setInt(0,0);
     pos.setInt(1,0); 
  }
  text(frameCount, 10, 10);
  jsonArray.setJSONArray(frameCount,pos);
  println(frameCount); 
  
  if(frameCount == END_FRAME){
    exit();
  }
}

void exit(){
    jsonArray.remove(0); // remove null
   saveJSONArray(jsonArray,"keyFrame.json");
}
