// I couldn't understand [] part clearly so I refered following web site
// https://ponponpopon.com/programming/processing-sample-array2d

float[][] distances;
float maxDistance;
int spacer;

void setup(){
  size(640,360);
  maxDistance=dist(width/2,height/2,width,height); //dist=distance 
  distances=new float[width][height];
  
  for(int y=0; y<height; y++){
    for(int x=0; x<width; x++){
      float distance=dist(width/2,height/2,x,y); //center
      distances[x][y]=distance/maxDistance*255;
    }
  }
  spacer=10;
  strokeWeight(6);
  noLoop();
}

void draw(){
  background(0);
  for(int y=0; y<height; y+=spacer){
    for(int x=0; x<width; x+=spacer){
      stroke(distances[x][y]);
      point(x+spacer/2, y+spacer/2);
    }
  }
}
