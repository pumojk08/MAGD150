import processing.video.*; 
import processing.sound.*;
PImage frame;
SoundFile song; 
boolean playing = false;

Movie movie;
//image
void setup(){
  size(640,430);
  frame = loadImage("apartment-chair-contemporary-1166379.jpg");
  song = new SoundFile(this, "fairydust.wav");
  movie = new Movie(this, "Pexels Videos 1828452.mp4");
  movie.loop();
}


//clickto play song
  void mousePressed(){
     song.play();
     song.rate(.85);
  }


void MovieEvent(Movie movie){
  movie.read();
}
//tint on image
void draw(){
  image(frame, 0, 0, width, height);
  tint(150,20);
 image(movie, 250, 200); 
}
