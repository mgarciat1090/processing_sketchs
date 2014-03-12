import processing.serial.*;

Serial myPort;

println(Serial.list());

myPort = new Serial(this, Serial.list()[0],9600);
myPort.write(65);
