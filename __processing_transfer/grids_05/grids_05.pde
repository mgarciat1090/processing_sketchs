import processing.video.*;

/** 
 * Synthesis 1: Form and Code
 * Wilson Grids by Casey Reas (www.processing.org)
 * p. 152
 * 
 * Step 4. 
 */

Movie vid0fx;

float numSquares = 2.0;
int gap = 100;
float xUnit = (width-gap*2)/numSquares-1;
float yUnit = (height-gap*2)/numSquares-1;
float squareWidth = xUnit;
int squareHeight = int(yUnit);


void setup() {
  size(600, 600, P3D);
  background(0);
  frameRate(1);

  noCursor();

  vid0fx = new Movie(this, "20130629_190508.mp4");
  vid0fx.loop();
}

void draw() {
  
  //blendMode(BLEND);
  pushMatrix();
  rotate(radians(180));
  scale(2.3);
  image(vid0fx, -360, -500);
  popMatrix();
  tint(0, 120, 230);
  stroke(0, 235, 226, 204);
  pushMatrix();
  //blendMode(ADD);
  translate(width/2, height/2);
  for (float y=0; y<numSquares; y=y+1) {
    for (float x=0; x<numSquares; x=x+1) {
      squareWidth = int(random(10, width));
      squareHeight = int(height);
      //squareHeight = int(random(10, 100));
      int ydiv = squareHeight/12;
      float xoff = xUnit/2+gap;
      float yoff = yUnit/2+gap;
      //float xp = xoff + (x*xUnit);
      float xp =  noise(xoff + (x*xUnit));
      float yp =  noise(yoff + (y*yUnit));

      beginShape();
      for (int i=0; i<=squareHeight-gap*2; i=i+ydiv) {
        if (i%120==0)
          rotate(i);

        float yy = noise(i*squareHeight/2+gap+i);
        float funX = xp*sin(mouseX -pmouseX)*120;
        float funY = xp*sin(mouseY -pmouseY)*120;

        if (i%4==0)
          xp = noise(xp);

        line(funX, funY, xp+squareWidth/2-gap, yp-squareHeight/2+gap+i);

        line(xp-squareWidth/2+gap, yp-squareHeight/2+gap+i, xp+squareWidth/2-gap, yp-squareHeight/2+gap+i);
        vertex(noise(xp-squareWidth/2+gap)*gap, noise(yp-squareWidth/2+gap)*gap);

        line(xp-squareWidth/2+gap, yp-squareHeight/2+gap+i, noise(mouseX), noise(mouseY));

        ellipse(xp-squareWidth/2+gap, yp-squareHeight/2+gap+i, 2, 2);
        ellipse(xp+squareWidth/2-gap, yp-squareHeight/2+gap+i, 2, 2);
        line(xp-squareWidth/2+gap, yp-squareHeight/2+gap+i, funX, funY);
        line( xp+squareWidth/2-gap, yp-squareHeight/2+gap+i, funX, funY);

        if (i%4==0) {
          ellipse(xp-squareWidth/2+gap, yp-squareHeight/2+gap+i, 10, 10);
          ellipse(xp+squareWidth/2-gap, yp-squareHeight/2+gap+i, 10, 10);
        }
        if (i%20==0) {

          if (x%20==0) {
            noFill();
          }
          float diamI =  random(1000)+x;
          ellipse(xp, yp, diamI, diamI);
        }
      }
      if (x%20==0) {
        noFill();
        float diamX =  random(100)+x;
        ellipse(xp, yp, diamX, diamX);
      }
    }
    endShape(CLOSE);
  }
  popMatrix();
  noFill();

  line(pmouseX, pmouseY, mouseX, mouseY);
  fill(0, 235, 226, 204);
  ellipse(mouseX, mouseY, 6, 6);
  ellipse(pmouseX, pmouseY, 2, 2);

  loadPixels();
  int limFX = (width*height);
  int repBuffer[] = new int[limFX]; 

  int offset = int(random(limFX));
  /*
  for (int i = 0; i < limFX; i++) {
    int gen = int(random( limFX));
    repBuffer [i] = pixels[i];
    if (gen % 10 == 0) {   
      for (int j = 0;j<50000;j++) {
        if (gen+j > 0 &&  gen+j<pixels.length)
          if (i+j<pixels.length)
            if (j+offset<pixels.length)
              pixels[j+offset] = pixels[j];
      }
    }   
  }
  */
  updatePixels();
  //saveFrame("visual-######.png");
}

void movieEvent(Movie m) {
  m.read();
}

