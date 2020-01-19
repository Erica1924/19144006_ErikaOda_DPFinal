
void setup(){
  size(355,355);
  colorMode(HSB,255);
  background(0);
  frameRate(50);
}

void draw(){
  int x=(int)random(355);
  int y=(int)random(355);  
 noStroke();
 if(50<x&&x<305 && 50<y&&y<305){
   fill(x-50,y-50,y-50);
  }
  else{
    fill(0,0,255);
  }
   ellipse(x,y,10,10);
}
