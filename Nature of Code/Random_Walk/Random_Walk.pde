Walker w;

void setup() {
  size(400,400);
  frameRate(30);
   background(255);
   
  // Create a walker object
  w = new Walker();

}

void draw() {
 
  // Run the walker object
  w.walk();
  w.render();
}
