
int hsbValue = 0;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  float dist = dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight((dist / 16));
  
  stroke(hsbValue, 100, 100);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  hsbValue = frameCount % 360;
}

