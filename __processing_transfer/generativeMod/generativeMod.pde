import processing.video.*;
Movie mov;

void setup() {
  size(900, 600, P3D);
  background(250); 
  frameRate(1);  
  //mov = new Movie(this,"20130203_035912.mp4");
  //mov.loop();
  noLoop();
}
void movieEvent(Movie trainMovie){
  //mov.read(); 
  
  
}

void draw(){
 //image(mov,0,0); 
 fill(20, 20);
 stroke(20, 20);
 //blendMode(BLEND); 
 float xstart = random(10,100);
 float ynoise = noise(10);
  translate(width/2, height/2, 0);
  for (float y = -(height/8); y <= (height/8); y+=3) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -(width/8); x <= (width/8); x+=3) {
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
 loadPixels();
 
 for (int i = 0; i < width; i++) {
  pixels[i] = color(50, 55, 100);
  }
 updatePixels(); 
}
void drawPoint(float x, float y, float noiseFactor) {
  noiseFactor = sin(noiseFactor);
  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4, -y);
  float edgeSize = noiseFactor * 26;
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}

