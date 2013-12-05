s deimport ddf.minim.*;
Minim minim;
AudioInput in;
AudioRecorder recorder;

void setup()
{
  size(512, 200, P3D);
  minim = new Minim(this);
  in = minim.getLineIn();
  recorder = minim.createRecorder(in, "myRecording.wav", true);
  textFont(createFont("Arial", 12));
}
void draw() {

  background(0);
  stroke(255);
  for (int i = 0;i<in.bufferSize() - 1;i++)
  {
    line(i, 50+in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }
  if (recorder.isRecording())
  {
    text("Currently recording...", 5, 15);
  }
  else {
    text("Not recording", 5, 15);
  }
}

void keyReleased() {

  if (key == 'r'){
    
   if(recorder.isRecording())
   {
    recorder.endRecord(); 
   }
    else{
      
     recorder.beginRecord(); 
    }
  }
  if(key == 's')
  {
    recorder.save();
    println("Done saving");
     
  }
  
}

