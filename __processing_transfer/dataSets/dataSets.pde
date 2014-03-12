color[] dessert = {
  #9F9694, #791F33, #BA3d49, #F1E6D4, #E2E1DC
};
color[] blues = {
  #16505A, #011D21, #009DB7, #055546, #E2E1DC
};
color[] palette = blues;


private static double[] fibonacciArr;
fibonacci f;

int rep = 100;
float easingFact = 0.048;

void setup() {
  size(1200, 700);
  background(palette[1]);
  smooth();
  f = new fibonacci();
  fibonacciArr = f.generate(rep);
  translate(width/2, height/2);
  rotate(PI/2);
 
}

void draw() {
  float easVal = 0;
  background(palette[1]);
 
  //blendMode(DARKEST);
   easVal = easVal + .001*rep*mouseX*easingFact;
  scale(easVal);
  if(mousePressed)
   rotate(sin(mouseX/mouseY)*tan(mouseX/mouseY));
  /*
  scale(.001*mouseX);
   if(mousePressed)
   rotate((PI/2)*mouseY);
   */
  for (int i = 0;i < fibonacciArr.length; i++) {
    //translate(rep*i, rep*i);

    noStroke();
    fill(palette[2], 50);
    stroke(palette[2]);
    //strokeWeight(2);
    float x = noise(sin((float)fibonacciArr[i])+mouseY)*(float)fibonacciArr[i]+mouseX;      
    //ellipse(x,height/2,20,20);
 
    line(0, x, x, 0);
    line(0, x, x, 0);
    if (i>0) {
      line(x, x, (float)fibonacciArr[i-1], 0);
      line(x, x, 0, (float)fibonacciArr[i-1]);
      line(x, x, 0, (float)fibonacciArr[i-1]);      
    }
    
    line(x, 0, 0, x);
    line(x, 0, 0, x);
              
    noStroke();
    ellipse(x,x,100,100);
    
  };
  
  
    
}

