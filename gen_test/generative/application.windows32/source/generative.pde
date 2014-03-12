import cc.arduino.*;
import processing.serial.*;

float val1,val2,val3; 
Arduino arduino;

Element[] elements = new Element[4];

void setup() {
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

void draw() {
  val1 = arduino.analogRead(0);
  val2 = arduino.analogRead(1);
  val3 = arduino.analogRead(2);

  background(6);
  lights();
  // Change height of the camera with mouseY
  camera(30.0, mouseY*1.35, 500.0+mouseX, // eyeX, eyeY, eyeZ
  200.0, 300.0, 0.0, // centerX, centerY, centerZ
  0.0, 1.0, 0.0); // upX, upY, upZ


  for (int i = 0;i < elements.length;i++) {

    PVector force = new PVector(noise(i)*(.00009), noise(i)*.00003);
    elements[i].applyForce(force);
    elements[i].update(val1,val2,val3);
    elements[i].display();
  }
}

void mousePressed() {
  saveFrame("liner"+ random(10) + "-####.tif");
}

