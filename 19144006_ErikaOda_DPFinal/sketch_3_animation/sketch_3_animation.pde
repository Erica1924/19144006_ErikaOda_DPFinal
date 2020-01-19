
float x=width/2;
float y=height/2;
float speed=1;
float xdirection=1;
float ydirection=1;

void setup(){
  size(400,300);
  colorMode(RGB,255);
  background(255,255,255);
  frameRate(10);
}
void draw(){
  fill(255,255,255);
  noStroke();
  ellipse(x,y,20,20);
 
}
void mousePressed(){
  fill(255,255,255,60);
  rect(0,0,width,height);


}
