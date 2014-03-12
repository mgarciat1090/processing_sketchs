import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import cc.arduino.*; 
import processing.serial.*; 

import cc.arduino.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class generative extends PApplet {




float val1,val2,val3; 
Arduino arduino;

Element[] elements = new Element[4];

public void setup() {
  size(1200, 900, P3D);
  background(6);
  println(Arduino.list()[0]);
  arduino = new Arduino(this, Arduino.list()[0], 57600);


  for (int i = 0;i < elements.length;i++) {
    elements[i] = new Element(-400+(i*200), 200, 300, 100+(i*20));
  }

  spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);

  noFill();
  smooth();
  frameRate(60);
  blendMode(ADD);
}

public void draw() {
  val1 = arduino.analogRead(0);
  val2 = arduino.analogRead(1);
  val3 = arduino.analogRead(2);

  background(6);
  lights();
  // Change height of the camera with mouseY
  camera(30.0f, mouseY*1.35f, 500.0f+mouseX, // eyeX, eyeY, eyeZ
  200.0f, 300.0f, 0.0f, // centerX, centerY, centerZ
  0.0f, 1.0f, 0.0f); // upX, upY, upZ


  for (int i = 0;i < elements.length;i++) {

    PVector force = new PVector(noise(i)*(.00009f), noise(i)*.00003f);
    elements[i].applyForce(force);
    elements[i].update(val1,val2,val3);
    elements[i].display();
  }
}

public void mousePressed() {
  saveFrame("liner"+ random(10) + "-####.tif");
}

class Corner {
  PVector location;
  float radius;
  float increment = 0.4f;

  Corner(float x, float y, float z) {
    location = new PVector();
    location.x = x;
    location.y = y;
    location.z = z;
    radius = 10;
  }

  public void display() {
    noFill();
    beginShape();
    for(float i = 0;i<2*PI;i+=increment){
    vertex(location.x+radius*sin(i),location.y+radius*cos(i),location.z);
    }
    endShape();
    beginShape();
     for(float i = 0;i<2*PI;i+=increment){
    vertex(location.x+radius*sin(i),location.y,location.z+radius*cos(i));
    }
    endShape();
 
  }
}

class Element {
  PVector location;

  PVector velocity;
  PVector acceleration;
  PVector tempNormal;

  float increment = 0.1f;
  //baseradius
  float bRadius = 100;
  //radius
  float radius = 100;
  float radiusMin = 2;

  PVector posInCircunference;

  PShape s;

  int vertexCount = 4;

  Corner corners[] = new Corner[vertexCount]; 

  float factor1 = 0.1f;
  float factor2 = 0.1f;
  float factor3 = 0.1f;



  Element(float x, float y, float z, float radius) {
    location = new PVector(x, y, z);    
    velocity = new PVector(0.28f, 0);
    acceleration = new PVector(0, 0);
    radius = radius;
  }

  public void applyForce(PVector force) {   
    acceleration.add(force);
  }
  public void update(float val1,float val2,float val3) {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    factor1 = val1/1000;
    factor2 = val2/1000;   
    factor3 = val3/100;
    println(factor1 + " - " + factor2 + " - " + factor3);
  }

  public void display() {
    
    radius = bRadius + factor1*factor2*(200+noise(factor3));
    stroke(
    map(factor1,0,1,0,255),
    map(factor2,0,1,0,255),
    map(factor3,0,10,0,255));
    
    strokeWeight(1);
    for (float n = 0;n<2*PI;n+=increment) {
      beginShape();
      for (float i = 0;i<2*PI;i+=increment) {
        vertex(location.x+(radius*sin(i)*factor1), location.y+(radius*cos(i)), location.z);
      }
      endShape(CLOSE);
    }


    for (float i = 0;i<2*PI;i+=increment) {      
      
      beginShape();
      for (float j = 0;j<2*PI;j+=increment) {        
        tempNormal = new PVector(location.x+radius*sin(j), location.y+radius*cos(j), location.z);
        tempNormal.add(velocity);        
        vertex(tempNormal.x+radius*sin(i)*factor2, tempNormal.y+radius*cos(i), tempNormal.z);
      }
      endShape(CLOSE);
    }

    //if (mousePressed) 
    for (float i = 0;i<2*PI;i+=increment) {      
            
      fill(255);
      for (float j = 0;j<2*PI;j+=increment) {

        if (i == j) {
          tempNormal = new PVector(location.x+radius*sin(j)*noise(j), location.y+radius*cos(j)*noise(j), location.z*noise(j));
          beginShape();
          for (float k = 0;k<2*PI;k+=increment) {
            vertex(tempNormal.x+radiusMin*sin(k)*noise(factor3), tempNormal.y+radiusMin*cos(k)*noise(factor3), tempNormal.z*noise(factor3));            
          }
          endShape(CLOSE);
        }
      }
      noFill();
    }
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "generative" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
