import ddf.minim.*;

Minim minim;
AudioPlayer input;
int x,y;
int grid = 128;
int spacing = 1;
float yScale = 2;

void setup(){
 size(1024,400);
 smooth();
 noStroke(); 
 minim = new Minim(this);
 input = minim.loadFile("343wwu.wav");
 input.play();
}

void draw(){
 fill(50,10);
 rect(0,0,width,height);
 float[] buffer = input.mix.toArray();
 
 for(int i = 1; i<=buffer.length; i+=buffer.length/grid){
  float x= map(i,0,buffer.length,0,width);
  float y = map(buffer[i-1]*yScale, -1,1,0,height);
  fill(102,145,250,100);
  rect(x+spacing, height, width/grid-2*spacing,-y); 
 }
 
}
void stop(){
 input.close();
 minim.stop();

super.stop(); 
}
