void setup(){
  
  size(1920,1080);
  background(0);
  ellipse(width/2,height/3,8,8);
  ellipse(width/3,2*height/3,8,8);
  ellipse(2*width/3,2*height/3,8,8);

  y1=height/3;
  x1=width/2;
  y2=2*height/3;
  x2=width/3;
  y3=2*height/3;
  x3=2*width/3;
  x=height/2;
  y=width/2;
 
}

int i,n;
float s,x,y,x1,x2,x3,y1,y2,y3;
void draw(){

  int s = int(random(3));
  if (s == 0){
    x = (x +x1)/2;
    y = (y +y1)/2;
  }
  else if (s==1){
      x =( x +x2)/2;
      y = (y +y2)/2;
  }
    else{
      x = (x + x3)/2;
      y = (y +y3)/2;
  }
    
    stroke(random(50,255),random(50,255),random(50,255));
    point(x,y);
     
}
