
float FORCE_VERTICAL;
float GRAVITY_ACCELERATION_Y;

float birdX;
float birdY;

float pipeX;
float pipeWidth;

float safeY;
float safeHeight;

void setup() {
  size(800, 400);
  setupBird();
  setupWorld();
  setupPipe();
}

void setupBird() {
  birdX = width/4;
  birdY = height/2;
}

void setupPipe() {
  pipeX = width;
  pipeWidth = 40.0;
  safeHeight = random( 60, 100 );
  safeY = random( 10, height - safeHeight - 10.0 );
}

void setupWorld() {
  FORCE_VERTICAL = 2.0;
  GRAVITY_ACCELERATION_Y = 0.2;
}

void draw() {
  refreshCanvas();
  drawPipe();
  updatePipe();
  drawBird();
  updateBird();
  handleKeyPress();
  checkForGameOver();
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
  fill(0);
  rect( pipeX, safeY, pipeWidth, safeHeight );
}

void updatePipe() {
  pipeX -= 2.0;
  refreshPipePosition();
}

void refreshPipePosition() {
  if( pipeX + pipeWidth < 0.0 ) {
    pipeX = width;
    resetHolePosition();
  }
}

void resetHolePosition() {
  safeHeight = random( 60, 100 );
  safeY = random( 10, height - safeHeight - 10.0 );
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
    FORCE_VERTICAL = -3.0;
  }
}

void checkForGameOver() {
  if( isBirdOnBottomOfScreen() || 
      isBirdAndPipeCollided() ) {
    setupBird();
    setupPipe();
    setupWorld();
  }
}

boolean isBirdOnBottomOfScreen() {
  return birdY > height;
}

boolean isBirdAndPipeCollided() {
  if( isBirdAndPipeAligned() && !isBirdInTheGap() ) {
    return true;
  }
  return false;
}

boolean isBirdAndPipeAligned() {
  return birdX + 20.0 > pipeX && birdX - 20.0 < pipeX + pipeWidth; 
}

boolean isBirdInTheGap() {
  return birdY > safeY && birdY < safeY + safeHeight;
}

