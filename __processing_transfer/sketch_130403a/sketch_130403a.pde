import processing.pdf.*;
import processing.video.*;
 
Buergschaft vis;
MovieMaker mm;
 
boolean saveMov = false, savePDF = false;
String txtInputType = "utf", txtSource = "buergschaft.txt", txtTitle = "Schiller: Die Bürgschaft";
 
 
void setup ()
{
  size(800, 800, JAVA2D);
  //cursor(HAND);
  colorMode(HSB, 360, 100, 100, 255);
  background (0, 0, 97);
  vis = new Buergschaft (new TextAnalyzer (txtSource, txtInputType, animate), txtTitle);
 
  smooth();
  frameRate (30);
 
}
 
void draw ()
{
  if (savePDF) beginRecord (PDF, "export/" + timestamp() + ".pdf");
  vis.display();
  if (saveMov) mm.addFrame();
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

