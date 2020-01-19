//パーティクルクラス
class ParticleVec2 {
  PVector position;       //位置
  PVector velocity;       //速度
  PVector acceleration;   //加速度
  PVector gravity;        //重力
  float radius;           //パーティクルの半径
  float friction;         //摩擦
  float mass;             //質量

  ParticleVec2() {
    //初期パラメーターを設定
    radius = 2.0;
    position = new PVector(width/2.0, height/2.0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    gravity = new PVector(0, 0);
    friction = 0.0;
    mass = 1.0;
  }

  //座標の更新
  void update() {
    velocity.add(acceleration);     //速度に加速度を加算
    velocity.add(gravity);          //重力を加える
    velocity.mult(1.0 - friction);  //摩擦力を加味した速度を計算
    position.add(velocity);         //速度から位置を算出
    acceleration.set(0, 0);         //加速度をリセット
  }

  //力を加える関数
  void addForce(PVector force) {
    //質量から加速度を計算 (a = f/m);
    force.div(mass);
    acceleration.add(force);
  }

  //壁でバウンドさせる
  void bounceOffWalls() {
    if (position.x < 0 || position.x > width) {
      velocity.x *= -1;
    }
    if (position.y < 0 || position.y > height) {
      velocity.y *= -1;
    }
    //画面からはみ出さないように画面内に限定
    position.x = constrain(position.x, 0, width);
    position.y = constrain(position.y, 0, height);
  }

  //パーティクルを描画
  void draw() {
    rectMode(CENTER);
    rect(position.x, position.y, radius*2, radius*2);
    rectMode(CORNER);
  }
}
