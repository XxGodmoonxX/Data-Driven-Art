#include <SPI.h>
#include <Ethernet.h>

#include <ArdOSC.h>

byte myMac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
byte myIp[]  = { 127, 0, 0, 1};
int  serverPort  = 5001;

int ledPin =  9;

int t=100;

OSCServer server;

// モーター制御
const int motorA = 9;
const int motorB = 8;
const int PWM_mot = 5;

void setup(){ 
  
 Serial.begin(19200);
 
 Ethernet.begin(myMac ,myIp); 
 server.begin(serverPort);
 
 //set callback function
 server.addCallback("/ard/aaa",&func1);
 
 pinMode(motorA, OUTPUT);
 pinMode(motorB, OUTPUT); 
 
}
  
void loop(){
  if(server.availableCheck()>0){
 //    Serial.println("alive! "); 
  }
  
  digitalWrite(motorA,LOW);
  digitalWrite(motorB,LOW);
  delay(1000);
  digitalWrite(motorA,LOW);
  digitalWrite(motorB,HIGH);
  delay(t);
  
  Serial.print(t);
}


void func1(OSCMessage *_mes){

  //get 1st argument(int32)
  t = _mes->getArgInt32(0);



}


