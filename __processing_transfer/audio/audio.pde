import ddf.minim.*;

Minim minim;
AudioSnippet song;

void setup(){
 size(200,200);
 minim = new Minim(this);

song = minim.loadSnippet("VEC2 Bassdrums Tekhouse 06.wav");


}
void draw(){
 background(0); 
}

void keyPressed()
{
 if(key == 'p')
  {
   song.play();
  } 
}

void stop(){
 song.close();
 minim.stop();
 super.stop(); 
  
}
