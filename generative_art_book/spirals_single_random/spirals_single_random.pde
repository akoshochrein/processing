size(800, 800);
background(255);
strokeWeight(0.5);
smooth();

int centX = 250;
int centY = 150;

float x, y;  
for( int i = 0; i < 100; ++i ) {
  stroke(random(200), random(200), random(255), 80);
  float radius = 10;
  float lastX = -999;
  float lastY = -999;
  float radiusNoise = random(10);
  for( float ang = random(1000); ang <= random(1440,2400); ang += 1 ) {
    radiusNoise += 0.05;
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise)*200)-100;
    float rad = radians(ang);
    x = centX + thisRadius * cos(rad);
    y = centY + thisRadius * sin(rad);
    if( lastX > -999 ) {
      line(x, y, lastX, lastY);
    }
    lastX = x;
    lastY = y;
  }
}
