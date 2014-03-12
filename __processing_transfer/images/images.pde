size(900,600);
PImage spaceInvader;
spaceInvader = loadImage("Space_invader.jpg");
image(spaceInvader,0,0);
filter(BLUR,3);

PImage webInvader;
String url = "http://farm3.staticflickr.com/2357/2148858093_0b469eeb97.jpg";
webInvader = loadImage(url);
image(webInvader,300,0,600,200);

filter(GRAY);
