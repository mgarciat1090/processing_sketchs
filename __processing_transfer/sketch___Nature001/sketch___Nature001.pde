PVector location = new PVector(100,100);
PVector velocity = new PVector(1,3.3);
Mover mover;

void setup(){
 size(640,360);
 background(255);
 mover = new Mover(); 
}
void draw(){
  /*
 background(255);
 location.add(velocity);
 if((location.x>width)||(location.x<0)){
  velocity.x = velocity.x*-1; 
 }
 if((location.y > height) || (location.y < 0)){
  velocity.y = velocity.y * -1;
 }
 stroke(0);
 fill(175);
 ellipse(location.x,location.y,16,16);
 */
 
 /*
 background(255);
 PVector mouse = new PVector(mouseX,mouseY);
 PVector center = new PVector(width/2,height/2);
 
 mouse.sub(center);
 mouse.mult(0.5);
 
 translate(width/2,height/2);
 line(0,0,mouse.x,mouse.y);
 */
 /* 
 background(255);
 PVector mouse = new PVector(mouseX,mouseY);
 PVector center = new PVector(width/2, height/2);
 mouse.sub(center); 
 mouse.normalize();
 mouse.mult(50); 
 float m = mouse.mag();
 fill(0);
 rect(0,0,m,10); 
 translate(width/2,height/2);
 line(0,0,mouse.x,mouse.y);
 */
 background(255);
 mover.update();
 mover.checkEdges();
 mover.display();  
 
 
}
