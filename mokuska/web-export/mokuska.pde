
PImage mokus;
int pxlWeight = 10;

void setup() {
  mokus = loadImage("http://img3.wikia.nocookie.net/__cb20121001033336/okami/images/d/d8/Amaterasu.jpg");
  size(1280, 1007);
  
  noStroke();
  
  image(mokus, 0, 0);
  loadPixels();
}

void draw() {
  
  pxlWeight = (int) map(mouseX, 0, width, 100, 1);
  
  for(int i = 0; i < width; i+=pxlWeight) {
    for(int j = 0; j < height; j+=pxlWeight) {
      
      fill(pixels[i + width*j]);
      rect(i, j, pxlWeight, pxlWeight);
    }
  }
  
}



