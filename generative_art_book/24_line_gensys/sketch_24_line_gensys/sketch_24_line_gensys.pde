
void setup() {
  size(500, 500, P3D);
  background(150);
  stroke(0,50);
  fill(255,200);
  float xStart = random(10);
  float yNoise = random(10);
  translate(width/2, height/2);
  for( float y = -(height/8); y < (height/8); y+=3 ) {
    yNoise += 0.02;
    float xNoise = xStart;
    for( float x = -(width/8); x < (width/8); x += 3 ) {
      xNoise += 2;
      drawPoint(x, y, noise(xNoise, yNoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x*noiseFactor*4, y*noiseFactor*4, -y);
  float edgeSize = noiseFactor * 26;
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}
