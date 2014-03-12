PieGrow pie1;
PieGrow pie2;
PieGrow pie3;
PieGrow pie4;
PieGrow pie5;

void setup(){
  size(600,200);
  smooth();  
  
  pie1 = new PieGrow("Pie A", 0.75);
  pie2 = new PieGrow("Pie B", 1.40);
  pie3 = new PieGrow("Pie C", 1.65);
  pie4 = new PieGrow("Pie D", 1.95);
  pie5 = new PieGrow("Pie E", 1.10);
 
}


void draw(){
 background(80);

 pie1.update();
 pie1.display();
 
 pie2.update();
 pie2.display();
  
 pie3.update();
 pie3.display(); 
 
 pie4.update();
 pie4.display();
  
 pie5.update();
 pie5.display(); 
}
