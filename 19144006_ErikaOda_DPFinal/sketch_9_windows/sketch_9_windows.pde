
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

Ball ball;


boolean inStopMode; //今は止まっているか動いているか

void setup(){
  //Processing Window
  size(800, 400);
  colorMode(RGB, 255);
  frameRate(60);
  background(255);
  ControlWindow controlWindow = new ControlWindow(this);

  ball=new Ball();
  ball.setup();
  
 
  // ここでthisというのはメインのクラス．
  // Processingでは自動的にスケッチの名前がメインのクラスにつけられる．
  inStopMode = true;
}

void draw(){

  fill(255, 255, 255, 60);
  rect(0, 0, width, height);
  if(!inStopMode){
  ball.draw();
  }
  else{
    ball.setup();
  }
}



void eventsCalledFromControlWindow(String actionCommand){
  // インナークラス内のイベント受け取り用ActionPerformed関数から呼ばれる関数を定義

  if(actionCommand.equals("Throwed"))
    inStopMode = false;
  else if(actionCommand.equals("Cleared"))
    inStopMode = true;
}


class ControlWindow extends JFrame implements ActionListener{
  // インナークラスとして，基本的なウィンドウのクラスであるJFrameを継承し，
  // かつイベントを取得できるActionListenerインタフェースを実装したものを定義する．

  JButton startButton, stopButton;
  JTextField textField;
  JPanel panel; // 一番基本的な表示領域格納をするためのクラス

  // メインのクラスのインスタンスを保持するための変数
  sketch_9_windows parentWindow; 

  ControlWindow(sketch_9_windows parentWindow){
    // 親クラス(JFrame)のコンストラクタを実行する
    super("Control Window");

    // 親となるウィンドウ(メイン)のインスタンスを保持する．
    this.parentWindow = parentWindow;

    // コントロールウィンドウのサイズを決める
    this.setSize(320, 240);

    // ボタンを作りイベントを登録し，"Border Layout"に従い配置する．
    // Border Layoutについては下記
    // https://docs.oracle.com/javase/tutorial/uiswing/layout/border.html

    panel = new JPanel();
    panel.setLayout(new BorderLayout());

    startButton = new JButton("Throw");
    startButton.setActionCommand("Throwed");
    startButton.addActionListener(this);
    panel.add(startButton, BorderLayout.NORTH);
    stopButton = new JButton("Clear");
    stopButton.setActionCommand("Cleared");
    stopButton.addActionListener(this);
    panel.add(stopButton, BorderLayout.SOUTH);
    textField = new JTextField("Control Panel Text Field");
    panel.add(textField, BorderLayout.CENTER);
  
    // JFrameの一番奥の表示格納領域(Content Pane)を持ってきて，
    // そこに今までボタンなどを追加してきたpanelを追加して表示できるようにする．
    this.getContentPane().add(panel);

    // 最後にコントロールウィンドウを可視化する
    this.setVisible(true);
  }
  
  @Override
  public void actionPerformed(ActionEvent e){
    //外側のクラスの文字列actionCommandにイベントが持ってきたActionCommandを代入
    String actionCommand = e.getActionCommand();

    //ControlWindow内のTextFieldにactionCommandを表示
    textField.setText(actionCommand);

    //親ウィンドウのイベント用関数を呼ぶ
    parentWindow.eventsCalledFromControlWindow(actionCommand);
  }
}
