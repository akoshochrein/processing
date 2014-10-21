
void setup() {
  size(720, 600);
  background(255);

  for ( int i = 0; i < 5; i++ ) {
    sinCurve((i+1)*50.0, i+1);
  }
}

void sinCurve( float amplitude, float waveLength ) { 
  PVector[] dot = new PVector[width];

  for ( int i = 0; i < dot.length; ++i ) {
    dot[i] = new PVector();
    dot[i].x = (width/dot.length) * i;
    dot[i].y = sin(radians(dot[i].x)/waveLength)*amplitude + height/2;
  }

  strokeWeight(1);
  stroke(0);
  for ( int i = 1; i < dot.length; ++i ) {
    line(dot[i-1].x, dot[i-1].y, dot[i].x, dot[i].y);
  }

  strokeWeight(3);
  stroke(255, 0, 0);
  for ( int i = 0; i < dot.length; i+=10 ) {
    point(dot[i].x, dot[i].y);
  }
}

