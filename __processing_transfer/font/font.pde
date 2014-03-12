//basic

size(600,200);
background(0);
String wordText = "A word is worth 1/1000th of a picture";
/*
//basic
size(600,200);
background(#302F2F);
String wordText = "A word is worth 1/1000th of a picture";
text(wordText,50,height/2);
*/

PFont sampleFont;
sampleFont = loadFont("AtmosphereBold-48.vlw");
textFont(sampleFont);
fill(#FFE224);
textAlign(LEFT, CENTER);
textLeading(50);
text(wordText,50,height/2);
