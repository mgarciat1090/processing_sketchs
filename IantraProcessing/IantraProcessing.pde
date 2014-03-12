int xCenter;
int yCenter;
int depthLevel = 4;
PShape  s;
PShape[] sLetters;
PShape[][] sOver;


void setup() {
  size(600, 600);
  xCenter =  width/2;
  yCenter =  height/2;
  s = loadShape("logo.svg");  
  //grab all the letters accesing the layer, and the group
  sLetters = s.getChild("Layer_1").getChild(0).getChildren(); 

  //copy all the letters to the array of shapes sOver


  //println(sLetter.length); 
  //shapeMode(CORNER); 
  smooth();
}
void draw() {
  PVector modVect;
  float x, y;
  for (int i = 0;i<sLetters.length;i++) {
    //shape(sLetters[i], xCenter, yCenter);    
    println(sLetters[i].getVertexCount());
    for (int j = 0;j<sLetters[i].getVertexCount();j++) {      
      //println(sLetters[i].getVertex(j));      
      //point(modVect.x,modVect.y);
    }
   //shape(sLetters[i], xCenter, yCenter);
  }
}

