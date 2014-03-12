import ddf.minim.*;
 
Minim minim;
AudioSample kick;
AudioSample snare;
 
void setup()
{
  size(512, 200, P3D);
  minim = new Minim(this);
  // load BD.wav from the data folder
  kick = minim.loadSample("VEC2 Bassdrums Tekhouse 06.wav", 2048);
  if ( kick == null ) println("Didn't get kick!");
  // load SD.wav from the data folder
  snare = minim.loadSample("VEC2 Snares 005.wav", 2048);
  if ( snare == null ) println("Didn't get snare!");
}
 
void draw()
{
  background(0);
  stroke(255);
  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < kick.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, kick.bufferSize(), 0, width);
    float x2 = map(i+1, 0, kick.bufferSize(), 0, width);
    line(x1, 50 - kick.mix.get(i)*50, x2, 50 - kick.mix.get(i+1)*50);
    line(x1, 150 - snare.mix.get(i)*50, x2, 150 - snare.mix.get(i+1)*50);
  }
}
 
void keyPressed()
{
  if ( key == 's' ) snare.trigger();
  if ( key == 'k' ) kick.trigger();
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  snare.close();
  minim.stop();
 
  super.stop();
}
