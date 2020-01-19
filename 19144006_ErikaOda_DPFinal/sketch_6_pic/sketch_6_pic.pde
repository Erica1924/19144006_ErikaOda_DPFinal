PImage img;

void setup(){
  size(800,600);
  img=loadImage("IMG_5170.jpg");
  img.resize(width,height);
}

void draw(){
  background(0);
  noStroke();
  int step=int(map(mouseX,0,width,1,100));
  // mouseXが0～widthのとき1～100の範囲に対応させる
  // マウスの位置で何ピクセルずつ動かすか＝widthの1/100ずつ
  // 以上をまるごとintにする
  for(int j=0; j<height; j+=step){ // jがjと同じように増える＝正方形モザイク
    for(int i=0; i<width; i+=step){ // iが0からstep=0～mouseX間の1/100ずつ増える
      color col=img.get(i,j);
      //(i,j) の色を取得する×width/step回繰り返す(for)
      
      fill(col);
      rect(i,j,step,step); // 正方形のはmouseXがでかいほどでかい
    }
  }
}
    
  
