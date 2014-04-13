
void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  resetFrame();
  generateRandomNoise( color( 255, 255, 255 ), 5000 );
  generateRandomNoise( color( 255, 0, 0 ), 5000 );
}

void generateRandomNoise( color c, int noPoints ) {
  stroke(c);
  for( int i = 0; i < noPoints; ++i ) {
    point( random(width), random(height) );
  }
}

void resetFrame() {
  background(0);
}
