int i;
int iter = 0;
float size = 8;
float len = 1;
int n;
ArrayList<PVector> r;
float[][] sigma = { {9,9,9},{9,9,100}, {9,9,9} };                                             //Giving stress tensor values
float[] b = {0 , 1, 0};                                                           //Burger vector
float[] F1 = {0,0,0} ;
float[] curr = {0,0,0};
float[] prev = {0,0,0};
float[] Fs = { 0,0};
float[][] F = { {0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}};
int z = 0;
float dt = 0.01;
float norm;

boolean play;

void keyPressed() {
  play = !play;
}


void setup(){
   
 play = true;
 frameRate(20);
 fullScreen(P2D);
  n = int(size/len);
  
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      F1[i] += sigma[i][j]*b[j];
    }
  }
  
  
  PVector current;
  r = new ArrayList<PVector>();
  for(int j=0;j<n+1;j++){
    current = new PVector();
    current.x = width/2 +j*13;
    current.y = height/2;
    r.add(current);
  }
  
}


void show(ArrayList<PVector> r){
   background(0);
  PVector prev = r.get(0);
  for(int i=1;i<r.size();i++){
    PVector w =r.get(i);
    line(prev.x,prev.y,w.x,w.y);
    prev = w;
  }
}

void draw(){
  
  if(iter%2==0)
  stroke(255,0,0);
  else
  stroke(0,0,255);
  
 if(play){
  ArrayList<PVector> newr;
  newr = new ArrayList<PVector>();
  
  PVector v = r.get(0);
  newr.add(v);
  
  for(int i=1; i<r.size(); i++){
    PVector w = new PVector();
    w = r.get(i);
    norm = sqrt((w.x - v.x)*(w.x - v.x) + ( w.y - v.y)*( w.y - v.y));
    curr[0] = (w.x - v.x);
    curr[1] = (w.y - v.y);
    Fs[0] = F1[2]*curr[1]+ (curr[0]-prev[0])*8;
    Fs[1] = -F1[2]*curr[0]+ (curr[1]-prev[1])*8;
    
    PVector current;
    current = new PVector();
    current.x = (w.x+v.x)/2+Fs[0]*dt*2;
    current.y = (w.y+v.y)/2+Fs[1]*dt*2;
    newr.add(current);
    v = w;
    prev = curr;
   
  }
  
  for(int i=0;i<r.size()/2;i++){
    if((-r.get(i).x+r.get(r.size()-1-i).x)<0){
      newr = new ArrayList<PVector>();
      for(int k=0;k<i;k++){
        newr.add(r.get(k));
      }
      for(int k=r.size()-1-i;k<r.size()-1;k++){
        newr.add(r.get(k));
      }
      break;
    }
  }
  
  
  newr.add(r.get(r.size()-1));
  r = newr;
  show(r); 
 }
  
 //iter++; 
}
