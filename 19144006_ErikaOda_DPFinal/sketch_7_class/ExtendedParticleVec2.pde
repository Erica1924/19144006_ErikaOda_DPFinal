class ExtendedParticleVec2 extends ParticleVec2{
int rcol;
  int gcol;
  int bcol;
  
  ExtendedParticleVec2(){
    super();
    
    rcol=(int)random(155) + 100;
    gcol=(int)random(155) + 100;
    bcol=(int)random(155) + 100;
  }

 @Override
 void draw(){
  
  fill(rcol,gcol,bcol);
  ellipse(location.x,location.y,mass*radius*2,mass*radius+2);
 
 }
}
