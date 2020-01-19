//運動方程式

class ParticleVec2{
  PVector force;
  PVector acceleration;
  PVector gravity;
  PVector location;
  PVector velocity;
  float mass;
  float friction;
  PVector min; //稼働範囲
  PVector max; //稼働範囲
  float radius; //パーティクル半径
  
  //コンストラクタ
  ParticleVec2(){
    radius=4.0;
    mass=1.0;
    friction=0.01;
    location=new PVector(0.0, 0.0); //位置を初期化
    velocity=new PVector(0.0, 0.0); //速度を初期化
    acceleration=new PVector(0.0, 0.0); //加速度を初期化
    gravity=new PVector(0.0, 0.0); //重力なし
    min=new PVector(0.0,0.0);
    max=new PVector(width,height);
  }
  
  void update(){
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.mult(1.0-friction);
    location.add(velocity);
    acceleration.set(0,0); //等速運動
  }
  void draw(){
  noStroke();
    fill(255);
    ellipse(location.x,location.y,mass*radius*2,mass*radius+2);
  
  }
  
  void bounceOffWalls(){
    if(location.x>max.x){
      location.x=max.x;
      velocity.x *=-1;
    }
    if(location.x<min.x){
      location.x=min.x;
      velocity.x *=-1;
    }
    if(location.y>max.y){
      location.y=max.y;
      velocity.y *=-1;
    }
    if(location.y<min.y){
      location.y=min.y;
      velocity.y *=-1;
    }
  }
  
  void throughWalls(){
    if(location.x<min.x){
      location.x=max.x;
    }
    if(location.y<min.y){
      location.y=max.y;
    }
    if(location.x>max.x){
      location.x=min.x;
    }
    if(location.y>max.y){
      location.y=min.y;
    }
  }
}
