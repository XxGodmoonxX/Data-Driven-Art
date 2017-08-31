//Arduino用
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
//OSC用
import oscP5.*;
import netP5.*;
OscP5 oscP5;
int receivePort = 23457;

 
//左側のタイヤ
int L_motorA = 9;
int L_motorB = 8;
int L_PWM_mot = 5;

//右側のタイヤ
int R_motorA = 7;
int R_motorB = 6;
int R_PWM_mot = 3;

int pwm_mot = 50;

void setup() {
  size(400, 400);
  arduino = new Arduino(this, Arduino.list()[7], 57600);
  arduino.pinMode(L_motorA, Arduino.OUTPUT); //信号用ピン
  arduino.pinMode(L_motorB, Arduino.OUTPUT); //信号用ピン
  arduino.pinMode(R_motorA, Arduino.OUTPUT); //信号用ピン
  arduino.pinMode(R_motorB, Arduino.OUTPUT); //信号用ピン
  println(Arduino.list());
  
  oscP5 = new OscP5(this, receivePort);
}

void draw() {
}

void mousePressed() {
  arduino.digitalWrite(L_motorA, Arduino.HIGH);
  arduino.digitalWrite(L_motorB, Arduino.LOW);
  arduino.analogWrite(L_PWM_mot, pwm_mot);
  
  arduino.digitalWrite(R_motorA, Arduino.LOW);
  arduino.digitalWrite(R_motorB, Arduino.HIGH);
  arduino.analogWrite(R_PWM_mot, pwm_mot);
  
  //delay(100);
  background(100);
  //println("press");
}

void mouseReleased() {
  //arduino.digitalWrite(L_motorA, Arduino.LOW);
  //arduino.digitalWrite(L_motorB, Arduino.LOW);
  //arduino.analogWrite(L_PWM_mot, pwm_mot);
  
  //arduino.digitalWrite(R_motorA, Arduino.LOW);
  //arduino.digitalWrite(R_motorB, Arduino.LOW);
  //arduino.analogWrite(R_PWM_mot, pwm_mot);
  
  //delay(100);
  background(50);
  //println("release");
}

void oscEvent(OscMessage msg) {
  
  //arduino.digitalWrite(L_motorA, Arduino.LOW);
  //arduino.digitalWrite(L_motorB, Arduino.LOW);
  //arduino.analogWrite(L_PWM_mot, pwm_mot);
  
  //arduino.digitalWrite(R_motorA, Arduino.LOW);
  //arduino.digitalWrite(R_motorB, Arduino.LOW);
  //arduino.analogWrite(R_PWM_mot, pwm_mot);
  
  //print("addrPattern: " + msg.addrPattern() + " ");
  //print("typetag: " + msg.typetag() + " ");
  if(msg.checkAddrPattern("/dir") == true) {
    //println(msg);
    println(msg.get(0).intValue());
    
    if (msg.get(0).intValue() == 1) { 
      println("Start");
      
      arduino.digitalWrite(L_motorA, Arduino.HIGH);
      arduino.digitalWrite(L_motorB, Arduino.LOW);
      arduino.analogWrite(L_PWM_mot, pwm_mot);
    
      arduino.digitalWrite(R_motorA, Arduino.LOW);
      arduino.digitalWrite(R_motorB, Arduino.HIGH);
      arduino.analogWrite(R_PWM_mot, pwm_mot);
      
      //delay(1000);
      
    } else if (msg.get(0).intValue() == 2) {
      println("Turn Right");
      
      arduino.digitalWrite(L_motorA, Arduino.HIGH);
      arduino.digitalWrite(L_motorB, Arduino.LOW);
      arduino.analogWrite(L_PWM_mot, pwm_mot);
  
      arduino.digitalWrite(R_motorA, Arduino.LOW);
      arduino.digitalWrite(R_motorB, Arduino.LOW);
      arduino.analogWrite(R_PWM_mot, pwm_mot);
      
    } else if (msg.get(0).intValue() == 3) {
      println("Turn Left");
      
      arduino.digitalWrite(L_motorA, Arduino.LOW);
      arduino.digitalWrite(L_motorB, Arduino.LOW);
      arduino.analogWrite(L_PWM_mot, pwm_mot);
  
      arduino.digitalWrite(R_motorA, Arduino.LOW);
      arduino.digitalWrite(R_motorB, Arduino.HIGH);
      arduino.analogWrite(R_PWM_mot, pwm_mot);
      
    } else {
      println("Stop");
      
      arduino.digitalWrite(L_motorA, Arduino.LOW);
      arduino.digitalWrite(L_motorB, Arduino.LOW);
      arduino.analogWrite(L_PWM_mot, pwm_mot);
  
      arduino.digitalWrite(R_motorA, Arduino.LOW);
      arduino.digitalWrite(R_motorB, Arduino.LOW);
      arduino.analogWrite(R_PWM_mot, pwm_mot);
    }
    
    //delay(1000);
  } 
}