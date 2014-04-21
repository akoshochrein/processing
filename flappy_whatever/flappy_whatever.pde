
int maxScore;
int currentScore;

float FORCE_VERTICAL;
float GRAVITY_ACCELERATION_Y;

float birdX;
float birdY;

float pipeX;
float pipeWidth;

float safeY;
float safeHeight;

void setup() {
  size(400, 400);
  setupScore();
  setupAllTheStuff();
}

void setupScore() {
  maxScore = 0;
  currentScore = 0;
}

void setupAllTheStuff() {
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
  drawObjects();
  drawScore();
  updateObjects();
  handleKeyPress();
  checkForGameOver();
}

void refreshCanvas() {
  background(0);
}

void drawObjects() {
  drawPipe();
  drawBird();
}

void drawPipe() {
  stroke(0);
  fill( 200, 255, 130 );
  rect( pipeX, 0.0, pipeWidth, height );
  fill(0);
  rect( pipeX, safeY, pipeWidth, safeHeight );
}

void drawBird() {
  fill(0, 0);
  stroke(255, 140, 0);
  ellipse( birdX, birdY, 20, 20 );
}

void drawScore() {
  fill(255);
  text(str(currentScore) + "/" + str(maxScore),
       width * 3 / 4, height * 4 / 5 );
}

void updateObjects() {
  updatePipe();
  updateBird();
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
  checkAndIncrementScore();
}

void resetHolePosition() {
  safeHeight = random( 60, 100 );
  safeY = random( 10, height - safeHeight - 10.0 );
}

void checkAndIncrementScore() {
  if( pipeX + pipeWidth == birdX ) {
    currentScore++;
    maxScore = maxScore > currentScore ? maxScore : currentScore;
  }
}

void updateBird() {
  applyGravity();
}

void applyGravity() {
  birdY += FORCE_VERTICAL;
  FORCE_VERTICAL += GRAVITY_ACCELERATION_Y;
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
    setupAllTheStuff();
    currentScore = 0;
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

