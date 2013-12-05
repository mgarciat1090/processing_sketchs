class Corner {
  PVector location;
  float radius;
  float increment = 0.4;

  Corner(float x, float y, float z) {
    location = new PVector();
    location.x = x;
    location.y = y;
    location.z = z;
    radius = 10;
  }

  void display() {
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

