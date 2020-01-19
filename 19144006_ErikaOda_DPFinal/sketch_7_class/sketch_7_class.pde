int NUM=500;
ParticleVec2[] particles=new ParticleVec2[NUM];
ExtendedParticleVec2 extendedParticleVec2Array[]=new ExtendedParticleVec2[NUM];

void setup(){
  size(800,600,P2D);
  frameRate(60);
  
  for(int i=0; i<NUM; i++){
    particles[i]=new ParticleVec2();
    extendedParticleVec2Array[i]=new ExtendedParticleVec2();
    particles[i].location.set(width/2,height/2);
    particles[i].acceleration.set(random(-10,10),random(-10,10));
    particles[i].gravity.set(0,0.1);
    particles[i].friction=0.01;
    extendedParticleVec2Array[i].location.set(width/2,height/2);
    extendedParticleVec2Array[i].acceleration.set(random(-10,10),random(-10,10));
    extendedParticleVec2Array[i].gravity.set(0,0.1);
    extendedParticleVec2Array[i].friction=0.01;
  }
}

void draw(){
  fill(0,31);
  rect(0,0,width,height);
    
    for(int i=0; i<NUM;i++){
    particles[i].update();
    particles[i].draw();
    particles[i].bounceOffWalls();
    extendedParticleVec2Array[i].update();
    extendedParticleVec2Array[i].draw();
    extendedParticleVec2Array[i].bounceOffWalls();

  }
}
