
float FORCE_VERTICAL;
float GRAVITY_ACCELERATION_Y;

float birdX;
float birdY;

float pipeX;
float pipeWidth;

void setup() {
  size(800, 400);
  setupBird();
  setupWorld();
  setupPipe();
}

void draw() {
  refreshCanvas();
  drawBird();
  drawPipe();
  updateBird();
  updatePipe();
  handleKeyPress();
}

void setupBird() {
  birdX = width/2;
  birdY = height/2;
}

void setupPipe() {
  pipeX = width;
  pipeWidth = 40.0;
}

void setupWorld() {
  FORCE_VERTICAL = 2.0;
  GRAVITY_ACCELERATION_Y = 0.1;
}

void drawBird() {
  fill(0, 0);
  stroke(255, 140, 0);
  ellipse( birdX, birdY, 20, 20 );
}

void updateBird() {
  applyGravity();
}

void drawPipe() {
  stroke(0);
  fill( 200, 255, 130 );
  rect( pipeX, 0.0, pipeWidth, height );
}

void updatePipe() {
  pipeX -= 2.0;
  refreshPipePosition();
}

void refreshPipePosition() {
  if( pipeX + pipeWidth < 0.0 ) {
    pipeX = width;
  }
}

void applyGravity() {
  birdY += FORCE_VERTICAL;
  FORCE_VERTICAL += GRAVITY_ACCELERATION_Y;
}

void refreshCanvas() {
  background(0);
}

void handleKeyPress() {
  if ( keyPressed ) {
    handleSpacePressed();
  }
}

void handleSpacePressed() {
  if ( key == ' ' ) {
    FORCE_VERTICAL = -5.0;
  }
}

