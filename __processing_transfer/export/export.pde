import processing.video.*;

Capture cam;

int wd = 600;
int hg = 400;
int iterC = 10;

int frate = 9;
boolean clear_bg = false;

int distW = wd/iterC;
int distH = hg/iterC;
float difFactor = 0.03;
float easing1 = 1.03;
float easing2 = 1.009;

float eX1, eY1;
float eX2, eY2;

color[] acid = {
 #071404,#1C520F, #55F72E,#40BA23,#4CDE29
};
color[] rtas = {
 #0F4C41, #1FA189, #31FFD9, #25C2A5, #2CE5C4
};
color[] distorion = {
 #2EFC5A, #38E029, #8CF739, #B8E029, #FCF42E
};
color[] palette = acid;

void setup() {
  size(wd, hg);
  smooth();
  frameRate(frate);
  background(40);
  
  cam = new Capture(this);
  //cam.start();
  noCursor();
  
}

void draw() {
  if(clear_bg){
    background(40);
  }
  
  blendMode(SCREEN );
  
  //cam.read();
  //tint(palette[1]);
  //image(cam,0,0);
  
  
  stroke(palette[int(random(1, 4))]);
  strokeWeight(int(random(0, 3)));
  //fill(palette[int(random(0,4))]);
  if (mousePressed) {   
      //    translate(random(20), random(20));      
      palette = rtas;
  }else{
       palette = acid;
  }

  //point(eX1,eY1);

  
  
  line(mouseX, mouseY, eX1, eY1);
  line(eX1, eY1, eX2, eY2);
  

  if (int(random(-1, 2))==0) {
    pushStyle();
    noFill();
    strokeWeight(noise(iterC)*iterC);
    //ellipse(mouseX, mouseY, distW*difFactor, distW*difFactor);
    point(mouseX, mouseY);
    popStyle();
  }
  else {
    pushMatrix();
    pushStyle();      
    
    stroke(palette[int(random(1, 4))]);
    strokeWeight(noise(iterC)*iterC*0.5);
    point(eX1, eY1);
    
    stroke(palette[int(random(1, 4))]);
    strokeWeight(noise(iterC)*iterC*0.3);  
    point(eX2, eY2);   
    
    popStyle(); 
    popMatrix();
  }

  eX1 += (mouseX-eX1)*alterX(easing1);
  eY1 += (mouseY-eY1)*alterY(easing1);
  
  eX2 += (mouseX-eX2)*alterX(easing2);
  eY2 += (mouseY-eY2)*alterY(easing2);
  
  
  saveFrame("frames/####.png");
}

float alterX(float inc) {
  float ret = sin(inc);
  println(ret);
  return ret;
}
float alterY(float inc) {
  float ret = (inc);
  println(ret);
  return ret;
}

