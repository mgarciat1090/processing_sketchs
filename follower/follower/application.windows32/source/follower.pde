import fisica.util.nonconvex.*;
import fisica.*;

import processing.video.*;
import java.awt.Color;

Capture video;
int count = 0;
int flag = 0;

FBody[] steps = new FBody[20];
FBox[] fbox = new FBox[10];
FWorld world;


void setup(){
  size(640,480,P2D);
  
  video = new Capture(this,width,height);
  video.start();
  
  smooth();
  
  Fisica.init(this);  
  world = new FWorld();
  world.setEdges();
  
  for(int f = 0;f< fbox.length;f++){
    fbox[f] = new FBox(30,90);
    fbox[f].setFill(100,20,130);
    fbox[f].setPosition(width/2,height/2);
    fbox[f].setGrabbable(true);  
    world.add(fbox[f]);  
  }
  
  
  frameRate(90);
  
  
}


void draw(){
  int[] boxPoint = new int[2];
  float brightest = 0;
  float darkest = 200;  
  float randValue = 1000.2;
  color movColors[];
  movColors = new color[video.width * video.height];
  
  video.loadPixels();
  count = 0;
    if (video.available()) {
      video.read();
      for(int i = 0;i<video.width; i++){
         for(int j= 0;j<video.height; j++){
           video.pixels[count] = video.pixels[count] & 0xFF;
           int pixValue = video.pixels[count];
           //movColors[count] = 
           float pixelBrightness = brightness(pixValue);
           //println(brightest + " - " + pixelBrightness);
            if(pixelBrightness < darkest){
              darkest = pixelBrightness;
              
              boxPoint[0] = i;
              boxPoint[1] = j;              
            }              
            count++;      
         } 
      }
      for(int f = 0;f< fbox.length;f++){
        //fbox[f].setPosition(boxPoint[0]+noise(f)*randValue,boxPoint[1]+noise(f)*randValue);
        //fbox[f].setRotation(noise(f)*randValue);
        fbox[f].addForce(boxPoint[0]+noise(f)*randValue,boxPoint[1]+noise(f)*randValue);
      }
      image(video,0,0,width,height);   
    }
      
  world.step();
  world.draw();
  
  //fbox.addForce(100,0);
    
}


class OutputBuffer extends PImage implements PConstants {
    
}

