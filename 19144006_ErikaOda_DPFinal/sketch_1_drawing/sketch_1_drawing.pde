void setup(){
size(600,600);
stroke(255,255,255);
background(0,0,0);
colorMode(HSB,255);
strokeWeight(1.5);
int rand=(int)random(1,5);
for(int i=0; i<500; i+=rand){
  int x=i*5;
  int y=x;
  int z=i*rand;
  int col=i*2;

  fill(col,200,250);
  ellipse(x,y,z,z);

}
}
void draw(){
}

void mouseMoved(){
  fill(0,0,0);
  noStroke();
  int m=15;
  ellipse(mouseX,mouseY,m,m);
}
