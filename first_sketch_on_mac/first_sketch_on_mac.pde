
Circle circles[] = new Circle[10];

void setup() {
  size(400, 400);
  background(0);
  for( int i = 0; i < 10; ++i ) {
    circles[i] = new Circle( random(width), random(height), random(width/2), color( 255, 255, 255 ) );
  }
}

void draw() {
  resetFrame();
  generateRandomNoise( color( 255, 255, 255 ), 5000 );
  generateRandomNoise( color( 255, 0, 0 ), 5000 );
  for( int i = 0; i < 10; ++i ) {
    circles[i].display( true );
  }
}

void generateRandomNoise( color c, int noPoints ) {
  stroke(c);
  for ( int i = 0; i < noPoints; ++i ) {
    point( random(width), random(height) );
  }
}

void resetFrame() {
  background(0);
}

class Circle {
  float x, y, r;
  color c;
  Circle(float x, float y, float r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }
  
  void display( boolean isEmpty ) {
    if( isEmpty ) {
      fill( 0, 0 );
    }
    stroke( this.c );
    ellipse( this.x, this.y, this.r, this.r );
  }
}

