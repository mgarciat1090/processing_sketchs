class PieGrow{
 float x;
 float y;
 float d;
 float angleStart;
 float angleMid;
 float angleEnd;
 float speed;
 float r;
 float g;
 float b;
 String title;

 PieGrow(String titleTemp, float angleEndTemp){
   d = random(50,250);
   x = random(d/2,width-d/2);
   y = random(d/2,height-d/2);

   angleStart = 0;
   angleMid = 0;
   angleEnd = angleEndTemp * PI;
   speed = random(.005, .05);
   r = random(255);
   g = random(255);
   b = random(255);
   
   title = titleTemp;
   
 } 
 
 void update(){
   angleMid += speed;
   angleMid = constrain(angleMid, 0, angleEnd);
   
   if((dist(x,y,mouseX,mouseY) < d/2) && mousePressed){
    x = x + (mouseX - pmouseX);
    y = y + (mouseY - pmouseY);  
   }
 }
 
 void display(){
  noStroke();
  fill(r,g,b);
  arc(x,y,d,d,0,angleMid);
  fill(0);
  text(title,x+5,y+15);
 }
  
}
