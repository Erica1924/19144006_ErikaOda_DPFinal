//SwingInProcessing_YATP5Window
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

String actionCommand;
boolean inStopMode;

// インナークラスとして定義するProcessing第2のウィンドウ
YATP5Window yatP5Window;
// 前項と同じくインナークラスとして定義するコントロールウィンドウ
ControlWindow controlWindow;

void setup(){
  // not use this PApplet Class
  // 本来のProcessingのメインウィンドウであるこの大元のPAppletを継承したクラスは使わない

  // PAppletを起動するのに必要な引数Stringの配列を指定．ここではウィンドウの名前だけ
  String[] args = {"Child Window"};
  
  // PAppletを継承したクラス，Processing第2のウィンドウのオブジェクトインスタンスを生成
  yatP5Window = new YATP5Window();

  // Static Method of PApplet Class 
  // to run child window as sketch
  // PAppletを継承したクラスのオブジェクトインスタンス化後の初期化する静的メソッド
  // ここでは名前とオブジェクトインスタンスを渡す
  PApplet.runSketch(args, yatP5Window);
  
  // 前項と同じくコントローラウィンドウの生成
  controlWindow = new ControlWindow(this);
  inStopMode = true;
  
  // Only Initialize Child Windows 
  // in this Parent Window setup()

  // Processing本来のウィンドウのsetup()では他に何もしない
}

void draw(){
  // Nothing to Draw in Parent Window
  // draw()でも何もしない
}

void eventsCalledFromControlWindow(){
  // コントーラがイベントを検知した時に呼ぶ関数
  if(actionCommand.equals("startButton_Pushed"))
    inStopMode = false;
  else if(actionCommand.equals("clearButton_Pushed"))
    inStopMode = true;
}

class YATP5Window extends PApplet{
  // Processingの第2のウィンドウ PAppletを継承して作る
  // インナークラスとして設計

  YATP5Window(){
    // Constructor
    // コンストラクタ
    super();

    // 親クラスのコンストラクタを呼ぶだけならば，
    // コンストラクタの定義は実は必要がない
    // 配列等，プリミティブ型の変数以外のインスタンス化を伴う場合，コンストラクタが必要
  }
  
  @Override
  public void settings(){
    // For second PApplet window
    // not write size() in "void setup()"
    // write into "public void settings()"
    // PAppletやそれを継承したクラスのオブジェクトが複数存在する場合，
    // ウィンドウサイズを指定するsize()関数だけは，本来のsetup()内ではなく，
    // settings()内に書かなければならない．
    // 複数PAppletウィンドウがある場合，
    // 元のメインスケッチクラスでも，settings()内でthis.size()を実行しなければならない
    this.size(640, 480);
  }
  
  @Override
  void setup(){
    //それ以外は通常のProcessingのsetup関数を書く
    this.colorMode(RGB, 255);
    this.background(255, 255, 255);
    this.frameRate(10);
    inStopMode = true;
  }
  
  @Override
  void draw(){
    int num=1000;
    this.fill(60, 60, 60, 0);
    
    if(!inStopMode){
       int xPos=(int)random(0,width);
       int yPos=(int)random(0,height);
     for(int i=0; i<num; i++){
       
  
       this.fill(xPos,yPos,xPos/4+yPos/4,60);
       noStroke();
     this.ellipse(xPos,yPos, 30, 30);
     }
    }
    else{
    this.fill(255,255,255);
    this.rect(0,0,width,height);
    }
  }
}

class ControlWindow extends JFrame implements ActionListener{
  // 前項のコントローラウィンドウのまま
  // インナークラスとして設計
  JButton startButton, stopButton;
  JTextField textField;
  JPanel panel; 

  sketch_10_p5Windows parentWindow;
  
  ControlWindow(sketch_10_p5Windows parentWindow){
   //Constructor 
   super("Control window");
   // Set the Parent Window
   this.parentWindow = parentWindow;
   
   this.setSize(320, 240);
   panel = new JPanel();
   panel.setLayout(new BorderLayout());

   startButton = new JButton("Start");
   startButton.setActionCommand("startButton_Pushed");
   startButton.addActionListener(this);
   panel.add(startButton, BorderLayout.NORTH);
   stopButton = new JButton("Clear");
   stopButton.setActionCommand("clearButton_Pushed");
   stopButton.addActionListener(this);
   panel.add(stopButton, BorderLayout.SOUTH);
   textField = new JTextField("Control Panel Text Field");
   panel.add(textField, BorderLayout.CENTER);

    // JFrameの一番奥の表示格納領域(Content Pane)を持ってきて，
    // そこに今までボタンなどを追加してきたpanelを追加して表示できるようにする．
    this.getContentPane().add(panel);
  
   this.setVisible(true);
  }
  
  @Override
  public void actionPerformed(ActionEvent e){
    // インナークラスでは，外のクラスの変数をそのまま使える
    // 外のクラス（メインスケッチ）の，actionCommand変数に代入する
    actionCommand = e.getActionCommand();
    textField.setText(actionCommand);

    // 外のクラスの関数を呼ぶ
    //（関数の判断に必要なactionCommand変数は外のクラスが持っているので，引数で渡さない）
    parentWindow.eventsCalledFromControlWindow();

    // 逆にこのControlWindowクラスを外部クラス
    // つまりProcessingのIDEでタブを作ってそちらに配置する場合は，
    // actionCommand変数は，このControlWindowクラスが持って，
    // 外のクラス（メインスケッチの）parentWindow.eventsCalledFromControlWindow()関数を呼ぶときに引数で渡す
  }
}
