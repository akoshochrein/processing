
float heights[];

void setup() {
  size(800, 600);
  background(#FFFFFF);
  heights = new float[(int) width];
  
  setupHeights();
  drawHeights();
  randomDots(100000);
}

void draw() {
}

void setupHeights() {
  for(int i = 0; i < heights.length; ++i) {
    heights[i] = random(height);
  }
}

void drawHeights() {
  for(int i = 0; i < heights.length; ++i) {
    line(i, height, i, heights[i]);
  }
}

void randomDots(int numberOfDots) {
  for(int i = 0; i < numberOfDots; ++i) {
    if(i % 2 == 0) {
      stroke(#000000);
    } else {
      stroke(#FFFFFF);
    }
    point(random(width), random(height));
    stroke(#000000);
  }
}

