float a = 0;

ArrayList<Box> sponge;
void setup() {
  size(400, 400, P3D);

  // An array of Box objects
  sponge = new ArrayList<Box>();

  // Start with one
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
}
void mousePressed() {
  // Generate the next set of boxes
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}

void draw() {
  background(51);
  stroke(255);
  fill(23,76,97);
  directionalLight(236,38,98,0,1,0);
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*0.4);
  rotateZ(a*0.1);

  for (Box b : sponge) {
    b.show();
  }
  a += 0.01;
}
