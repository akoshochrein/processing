
void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  stroke(255);
  for( int i = 0; i < 1000; ++i ) {
    point( random(400), random(400) );
  }
}

