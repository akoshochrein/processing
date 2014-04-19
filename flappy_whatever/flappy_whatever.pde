
float FORCE_VERTICAL;
float GRAVITY_ACCELERATION_Y;

float birdX;
float birdY;

void setup() {
  size(400,400);
  setupBird();
  setupWorld();
}

void setupBird() {
  birdX = width/2;
  birdY = height/2;
}

void setupWorld() {
  FORCE_VERTICAL = 2.0;
  GRAVITY_ACCELERATION_Y = 0.1;
}

void drawBird() {
  fill(0,0);
  stroke(255, 140, 0);
  ellipse( birdX, birdY, 20, 20 );
}

void updateBird() {
  applyGravity();
}

void applyGravity() {
  birdY += FORCE_VERTICAL;
  FORCE_VERTICAL += GRAVITY_ACCELERATION_Y;
}

void refreshCanvas() {
  background(0);
}

void draw() {
  refreshCanvas();
  drawBird();
  updateBird();
  handleKeyPress();
}

void handleKeyPress() {
  if( keyPressed ) {
    handleSpacePressed();
  }
}

void handleSpacePressed() {
  if( key == ' ' ) {
    FORCE_VERTICAL = -5.0;
  }
}

