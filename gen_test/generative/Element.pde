class Element {
  PVector location;

  PVector velocity;
  PVector acceleration;
  PVector tempNormal;

  float increment = 0.1;
  //baseradius
  float bRadius = 100;
  //radius
  float radius = 100;
  float radiusMin = 2;

  PVector posInCircunference;

  PShape s;

  int vertexCount = 4;

  Corner corners[] = new Corner[vertexCount]; 

  float factor1 = 0.1;
  float factor2 = 0.1;
  float factor3 = 0.1;



  Element(float x, float y, float z, float radius) {
    location = new PVector(x, y, z);    
    velocity = new PVector(0.28, 0);
    acceleration = new PVector(0, 0);
    radius = radius;
  }

  void applyForce(PVector force) {   
    acceleration.add(force);
  }
  void update(float val1,float val2,float val3) {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    factor1 = val1/1000;
    factor2 = val2/1000;   
    factor3 = val3/100;
    println(factor1 + " - " + factor2 + " - " + factor3);
  }

  void display() {
    
    radius = bRadius + factor1*factor2*(200+noise(factor3));
    stroke(
    map(factor1,0,1,0,255),
    map(factor2,0,1,0,255),
    map(factor3,0,10,0,255));
    
    strokeWeight(1);
    for (float n = 0;n<2*PI;n+=increment) {
      beginShape();
      for (float i = 0;i<2*PI;i+=increment) {
        vertex(location.x+(radius*i*sin(i)*factor1)*noise(i*factor1), location.y+(radius*sin(i)*factor1), location.z);
      }
      endShape(CLOSE);
    }


    for (float i = 0;i<2*PI;i+=increment) {      
      
      beginShape();
      for (float j = 0;j<2*PI;j+=increment) {        
        tempNormal = new PVector(location.x+radius*sin(j)*noise(j*factor2), location.y+radius*noise(factor2), location.z);
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

