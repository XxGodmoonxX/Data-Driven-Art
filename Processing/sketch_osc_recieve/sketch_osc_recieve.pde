import oscP5.*;
import netP5.*;

OscP5 oscP5;
//NetAddress myRemoteLocation;

int receivePort= 23457;

PFont font;

void setup() {
  size(400, 400);
  
  oscP5 = new OscP5(this, receivePort);
   
}

void draw() {
}

void mousePressed() {
}

void mouseReleased() {
}

void oscEvent(OscMessage msg) {
  //print("addrPattern: " + msg.addrPattern() + " ");
  //print("typetag: " + msg.typetag() + " ");
  if(msg.checkAddrPattern("/dir") == true) {
    //println(msg);
    //println(msg.get(0).intValue());
    if (msg.get(0).intValue() == 1) {
      println("start");
    } else if (msg.get(0).intValue() == 2) {
      println("Turn Right");
    } else if (msg.get(0).intValue() == 3) {
      println("Turn Left");
    } else {
      println("Stop");
    }
    
  }
}