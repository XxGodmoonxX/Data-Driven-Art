import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
 
//左側のタイヤ
int L_motorA = 9;
int L_motorB = 8;
int L_PWM_mot = 5;

//右側のタイヤ
int R_motorA = 7;
int R_motorB = 6;
int R_PWM_mot = 3;

int pwm_mot = 255;

void setup() {
  size(400, 400);
  arduino = new Arduino(this, Arduino.list()[7], 57600);
  arduino.pinMode(L_motorA, Arduino.OUTPUT); //信号用ピン
  arduino.pinMode(L_motorB, Arduino.OUTPUT); //信号用ピン
  arduino.pinMode(R_motorA, Arduino.OUTPUT); //信号用ピン
  arduino.pinMode(R_motorB, Arduino.OUTPUT); //信号用ピン
  println(Arduino.list());
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
  
  delay(100);
  background(100);
  println("a");
}

void mouseReleased() {
  arduino.digitalWrite(L_motorA, Arduino.LOW);
  arduino.digitalWrite(L_motorB, Arduino.LOW);
  arduino.analogWrite(L_PWM_mot, pwm_mot);
  
  arduino.digitalWrite(R_motorA, Arduino.LOW);
  arduino.digitalWrite(R_motorB, Arduino.LOW);
  arduino.analogWrite(R_PWM_mot, pwm_mot);
  
  delay(100);
  background(50);
  println("b");
}

void keyPressed() {
  if (key == 'a') {
    arduino.digitalWrite(L_motorA, Arduino.LOW);
    arduino.digitalWrite(L_motorB, Arduino.LOW);
    arduino.analogWrite(L_PWM_mot, pwm_mot);
  
    arduino.digitalWrite(R_motorA, Arduino.LOW);
    arduino.digitalWrite(R_motorB, Arduino.HIGH);
    arduino.analogWrite(R_PWM_mot, pwm_mot);
  }
  
  if (key == 's') {
    arduino.digitalWrite(L_motorA, Arduino.HIGH);
    arduino.digitalWrite(L_motorB, Arduino.LOW);
    arduino.analogWrite(L_PWM_mot, pwm_mot);
  
    arduino.digitalWrite(R_motorA, Arduino.LOW);
    arduino.digitalWrite(R_motorB, Arduino.LOW);
    arduino.analogWrite(R_PWM_mot, pwm_mot);
  }
  
  if (key == 'd') {
    arduino.digitalWrite(L_motorA, Arduino.LOW);
    arduino.digitalWrite(L_motorB, Arduino.LOW);
    arduino.analogWrite(L_PWM_mot, pwm_mot);
  
    arduino.digitalWrite(R_motorA, Arduino.LOW);
    arduino.digitalWrite(R_motorB, Arduino.LOW);
    arduino.analogWrite(R_PWM_mot, pwm_mot);
  }
    
}