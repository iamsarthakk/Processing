float angle = 0;
int w = 80;
int cols;
int rows;
Curve[][] curves;

void setup(){
  //size(800,800);
  fullScreen(P2D);
  cols = width/w-1;
  rows = height/w-1;
  curves = new Curve[rows][cols];
  
  for(int i=0;i<rows;i++) {
    for(int j=0;j<cols;j++){
      curves[i][j] = new Curve();
      }
  }
}


void draw(){
  background(0);
  float d = w-10;
  float r = d/2;
  stroke(255);
  noFill();
  for(int i=0;i<cols;i++){
    float cx = i*w+w + w/2;
    float cy = w/2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx,cy,d,d);
    float x = r*cos(angle*(i+1) -PI/2);
    float y = r*sin(angle*(i+1) -PI/2);
    
    strokeWeight(8);
    stroke(255);
    point(cx+x,cy+y);
    stroke(255,50);
    strokeWeight(1);
    line(cx+x,0,cx+x,height);
    
    for(int j=0;j<rows;j++) {
      curves[j][i].setX(cx+x);
  }
  }

    
  stroke(255);
  noFill();
  for(int j=0;j<rows;j++){
    float cy = j*w+w + w/2;
    float cx = w/2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx,cy,d,d);
    float x = r*cos(angle*(j+1) -PI/2);
    float y = r*sin(angle*(j+1) -PI/2);
    
    strokeWeight(8);
    point(cx+x,cy+y);
    stroke(255,50);
    strokeWeight(1);
    line(0,cy+y,width,cy+y);
    
    for(int i=0;i<cols;i++) {
      curves[j][i].setY(cy+y);
  }
  }
  
  for(int i=0;i<rows;i++) {
    for(int j=0;j<cols;j++){
      curves[i][j].addPoint();
      curves[i][j].show();
    }
}
    
  
  angle -= 0.01;
  
  if (angle<-TWO_PI){
    for(int j=0;j<rows;j++){
      for(int i=0;i<cols;i++){
        curves[j][i].reset();
      }
    }
    //saveFrame("lissajous.png");
    angle = 0;
  }


  
}
