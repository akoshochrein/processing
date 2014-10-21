
void setup() {
  size(1200, 800);
  background(0);
  fill(0);
  stroke(0);
  drawCurve();
}

void drawCurve() {
  for ( int i = 0; i < 3; ++i ) {
    float prevX = width/2 + radians(0)*(i+1)*100 * cos(radians(0));
    float prevY = height/2 + 200 * sin(radians(0));
    for ( float t = 0; t < 360; t += 0.1 ) {
      float x = width/2 + radians(t/2)*(i+1)*100 * cos(radians(t));
      float y = height/2 + (i+1.2)*120 * sin(radians(t));

      for ( int j = 0; j < 3; ++j ) {
        strokeWeight(t/10);
        stroke((255-abs(y-height/2)*255/height)/3);
        line(prevX, prevY, x, y);
      }
      prevX = x;
      prevY = y;
    }
  }
}

