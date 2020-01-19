class Ball{
  //ボール描画に使う関数
  PVector force;
  PVector acceleration;
  PVector location;
  PVector velocity;
  PVector gravity;
  float mass;
  float friction;
  PVector min;
  PVector max;
  
  void setup(){
    location=new PVector(0,0);
    velocity=new PVector(0,0);
    gravity=new  PVector(0,1);
    force=new PVector(10,5);
    min=new PVector(0,0);
    max=new PVector(width,height);
    mass=1;
    friction=0.01;
    acceleration=force.mult(mass);
  }
  
  void draw(){
    fill(0);
    noStroke();
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.mult(1-friction);
    location.add(velocity);
    acceleration.set(0,0);
    ellipse(location.x,location.y,20,20);
    bounceOffWalls();
  }
  
  void bounceOffWalls(){
    if(location.y>max.y){
      location.y=max.y;
      velocity.y*=-1;
    }
    if(location.y<min.y){
      location.y=min.y;
      velocity.y*=-1;
    }
  }
}
