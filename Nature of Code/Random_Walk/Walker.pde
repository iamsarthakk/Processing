// A random walker class!

class Walker {
  float x, y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(255,35,78);
    point(x,y);
    
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    loadPixels();
    int choice = int(random(4));
    switch(choice){
      case 0: 
      if(pixels[int(x+y*width)]!=color(255,35,78)){
        x++;
      }
      break;
      case 1:if(pixels[int(x+y*width)]!=color(255,35,78)){
        x--;
      }
      break;
      case 2: if(pixels[int(x+y*width)]!=color(255,35,78)){
        y++;
      }
      break;
      case 3:if(pixels[int(x+y*width)]!=color(255,35,78)){
        y--;
      }
      
    }
      x = constrain(x,0,width-1);
      y = constrain(y,0,height-1);
      
  }
}
