float a;

void setup() {
  size(640, 360);
  frameRate(10);
  stroke(255,60);
  colorMode(RGB,255,255,255,100);
  a = height/2;
}

void draw() {
  background(51);
  lights();
  translate(width / 2, height / 2);
  makeLine(0,150,50);
  makeLine(400,300,70);
}
void makeLine(int x, int y,int lvl){
 line(x+sin(x)*a, sin(a)*y, y+sin(a)*100+a, sin(a)*300+a*lvl);  
  a = noise(10,100)+(a - 0.5);
  if (a < 0) { 

    a = height; 
  } 
  if(lvl>1){
   makeLine(x,y,lvl-1);       
  }
}
