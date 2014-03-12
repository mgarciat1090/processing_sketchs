PVector location = new PVector(100,100);
PVector velocity = new PVector(1,3.3);
Mover mover;

void setup(){
 size(640,360);
 background(255);
 mover = new Mover(); 
}
void draw(){

 background(255);
 mover.update();
 mover.checkEdges();
 mover.display();  
 
 
}

void keyPressed(){
 if(key == CODED){
    if(keyCode == UP){
      
      mover.acceleration.mult(2);
    }else if(keyCode == DOWN){
      
    println(mover.acceleration.x + " - " + mover.acceleration.y);
      mover.acceleration.div(2);  
    }
 } 
}
