float[][] distances;
float maxDistance;
int spacer;

int timer = 0;

void setup() {
  size(900, 600);
  maxDistance = dist(width/2, height/2, width, height);
  distances = new float[width][height];
  frameRate(360);
  spacer = 10;
  loop();
}


void draw() {
  background(0);
  for (int y = 0;y<height;y++) {
    for (int x = 0;x<width;x++) {
      float distance = dist(width/2, height/2, x, y);
      distances[x][y] = cos(timer*distance/maxDistance)*distance/maxDistance*255;
    }
  }
  timer++;
  timer++;
  timer++;
  
  for (int y = 0;y<height; y+= spacer) {
    
    for (int x = 0;x<width;x+= spacer) {
      stroke(distances[x][y]);
      point(x+spacer/2, y+spacer/2);
    }
    
  }
  
}


