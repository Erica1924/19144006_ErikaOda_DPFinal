int NUM = 5000;
ParticleVec2[] particles = new ParticleVec2[NUM];
  
int r=(int)random(0,155)+100;
int g=(int)random(0,155)+100;
int b=(int)random(0,155)+100;

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  noStroke();


  fill(r,g,b);
  for (int i = 0; i < NUM; i++) {
    //パーティクルをインスタンス化
    particles[i] = new ParticleVec2();
    particles[i].position.set(width/2, height/4);
    particles[i].gravity.set(0, 0.1);
    particles[i].friction = 0.002;
    particles[i].mass = 1.0;
    particles[i].radius = 1.5;
 
    float length = random(10);
    float angle = random(2*PI);
    particles[i].addForce(new PVector(length*cos(angle), length*sin(angle)));
  }
  background(0);
}

void draw() {
  
  fill(0,31);
  rect(0, 0, width, height);
  
  //パーティクルを描画
  fill(r,g,b);
  for (int i = 0; i < NUM; i++) {
    particles[i].update();
    particles[i].bounceOffWalls();
    particles[i].draw();
  }
}

void mouseReleased() {
  for (int i = 0; i < NUM; i++) {
    //パーティクルをインスタンス化
    particles[i] = new ParticleVec2();
    particles[i].position.set(mouseX, mouseY);
    particles[i].gravity.set(0, 0.1);
    particles[i].friction = 0.002;
    particles[i].mass = 1.0;
    particles[i].radius = 1.5;
    
    float length = random(10);
    float angle = random(2*PI);
    particles[i].addForce(new PVector(length*cos(angle), length*sin(angle)));

    
  }
}
