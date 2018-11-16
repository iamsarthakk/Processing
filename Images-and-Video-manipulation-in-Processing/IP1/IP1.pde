import processing.video.*;
Capture vid;


void setup(){
  size(600,400);
  vid = new Capture(this,640,480,30);
  vid.start();
}


void captureEvent(Capture vid){
  vid.read();
}

void draw() {
  

  vid.read();
  background(0);
  loadPixels();
  for(int i=0;i<width-1;i++){
    for(int j=0;j<height-1;j++){
      
      pixels[i+j*width] = vid.pixels[i+j*width];
      updatePixels();
    }
  }
}
