import processing.awt.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

void setup(){
  size(640, 480);
  Canvas canvas = (Canvas)surface.getNative();
  JLayeredPane layeredPane = (JLayeredPane)canvas.getParent().getParent();
  JTextField textField = new JTextField("Push the button if you want to clear this field");
  textField.setBounds(10, 360, 620, 20);
  MyButtonListener myButtonListener = new MyButtonListener();
  myButtonListener.setTextField(textField);
  
  // ボタンを作って，場所とサイズを決める
  JButton button1 = new JButton("Button 1");
  button1.setBounds(10, 390, 100, 20);

  // このボタンの「アクションコマンド」文字列を指定する．
  // ここでは"button1_push"という文字列を指定している
  button1.setActionCommand("button1_push");
  
  //ボタンを，ActionListenerを実装したクラスのオブジェクトに登録する
  button1.addActionListener(myButtonListener);
  
  // Paneにテキストフィールドとボタンを追加
  layeredPane.add(textField);
  layeredPane.add(button1);
}

void draw(){
  ellipse(0,0,100,100);
}

//インナークラス
class MyButtonListener implements ActionListener {
  JTextField textField;
  void setTextField(JTextField textField){
    this.textField = textField;
  }
  
  //ActionListenerを使うための関数actionPerformed関数のオーバーライド
  @Override
  public void actionPerformed(ActionEvent e){
   String actionCommand = e.getActionCommand();
   if(actionCommand.equals("button1_push")){
    textField.setText("");
   }
  }
  
}
