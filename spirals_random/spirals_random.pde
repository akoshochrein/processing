
int NO_SPIRALS = 50;
int NO_LOOPS_PER_SPIRAL = 16;

void setup() {
  background(255);
  size(800, 800);
  smooth();  
  drawManySpirals(NO_SPIRALS);
  saveFrame("screen-####.jpg");
}

void drawManySpirals( int numberOfSpirals ) { 
  for( int i = 0; i < numberOfSpirals; ++i ) {
    setCurrentSpiralBrush(numberOfSpirals, i);
    drawSpiral();
  }
}

void setCurrentSpiralBrush( int numberOfSpirals, int currentSpiralIndex ) {
    strokeWeight(getSpiralStrokeWeight(numberOfSpirals, currentSpiralIndex));
    stroke(getSpiralStroke(numberOfSpirals, currentSpiralIndex));
}

int getSpiralStrokeWeight( int numberOfSpirals, int currentSpiralIndex ) {
  return numberOfSpirals - currentSpiralIndex + 1;
}

int getSpiralStroke( int numberOfSpirals, int currentSpiralIndex ) {
  return 255 - 255 / (numberOfSpirals+1) * currentSpiralIndex;
}

void drawSpiral() {
  float prev_x = width/2;
  float prev_y = height/2;

  for ( int i = 0; i < 360*NO_LOOPS_PER_SPIRAL; i += 3 ) {
    
    float thisRadius = i * 0.1 * noise(random(1)/5);
    float x = width/2 + thisRadius*cos(radians(i));
    float y = height/2 + thisRadius*sin(radians(i));
    line(prev_x, prev_y, x, y);
    prev_x = x;
    prev_y = y;
  }
}

