void setup(){
  size(600,800);
  background(255,255,255);
  noStroke();
  fill(0);
  rect(50,120,50,50);
  fill(255,0,0);
  rect(50,50,50,50);
  stroke(0);
  fill(255,255,255);
  rect(50,190,50,50);
}

void mousePressed(){
  if(mouseX>=50&&mouseX<=100&&mouseY>=50&&mouseY<=100){
    stroke(255,0,0);
  }
  if(mouseX>=50&&mouseX<=100&&mouseY>=120&&mouseY<=170){
    stroke(0,0,0);
  }  
  if(mouseX>=50&&mouseX<=100&&mouseY>=190&&mouseY<=240){
    stroke(255,255,255);
  }
  
}
  
void mouseDragged(){

  line(pmouseX,pmouseY,mouseX,mouseY); //(pX,pY)to(X,Y)
}

void draw(){
}
