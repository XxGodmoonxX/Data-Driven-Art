#include "ofApp.h"
#include "ofxPubSubOsc.h"

unordered_map<int, array<float, 5>> raw_bandpower_data;
unordered_map<int, float> bandpower_ratio_map;

ofxOscSender sender;
int direction = 0;
//--------------------------------------------------------------
void ofApp::setup(){
    
    gui.setup();
    gui.add(ratio_threshold.setup("ratio_thredshold", 1.2, 1.0, 6.0));
    
    ofSetFrameRate(60);
    // openbciから受信するosc
    ofxSubscribeOsc(12345, "/openbci", [&](ofxOscMessage & m){
        
        //bandpowerのデータでない場合は受信しない
        if(m.getNumArgs()!=6){
            return;
        }
        else{
            int id = m.getArgAsInt(0);
            for(int i=1;i<m.getNumArgs();i++){
                float data = m.getArgAsFloat(i);
                raw_bandpower_data[id][i] = data;
            }
        }
    }
                    );
    
    // oscの送信先の設定
    sender.setup("127.0.0.1", 23457);
   
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    //3, 4のalpha, betaの比率を求める
    vector<int> selected_ch = {3,4};
    for(auto&id:selected_ch){
        float alpha = raw_bandpower_data[id][2];
        float beta = raw_bandpower_data[id][3];
        float ratio =  beta/ alpha;
        bandpower_ratio_map[id] = ratio;
    }
    // 0: stop 1:front 2:right 3:left
    if(bandpower_ratio_map[3]>ratio_threshold && bandpower_ratio_map[4]>ratio_threshold){
        direction = 1;
    }
    else if(bandpower_ratio_map[3]>ratio_threshold && bandpower_ratio_map[4]<ratio_threshold){
        direction = 2;
    }
    else if(bandpower_ratio_map[4]>ratio_threshold && bandpower_ratio_map[3]<ratio_threshold){
        direction = 3;
    }
    else{
        direction = 0;
    }
    ofxOscMessage m;
    m.setAddress("/dir");
    m.addIntArg(direction);
    sender.sendMessage(m);
    
    // rai
    int i=0;
    for(auto a:bandpower_ratio_map){
        int id = a.first;
        float ratio = a.second;
        stringstream ss;
        ss << "ch " << id << " " << ratio << endl;
        ofDrawBitmapString(ss.str(),  10 , 210 + 10 * i );
        i++;
    }
    
    ofDrawBitmapString("direction " +   ofToString(direction), 10, 240);
    gui.draw();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){
    
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
