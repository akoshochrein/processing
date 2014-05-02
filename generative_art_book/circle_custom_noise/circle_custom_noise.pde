
void setup() {
  size(500, 300);
  background(255);
  strokeWeight(5);
  smooth();
  
  float radius = 100;
  float centX = width/2;
  float centY = height/2;
  
  stroke(0, 30);
  noFill();
  ellipse(centX, centY, radius*2, radius*2);
  
  stroke(20, 50, 70);
  strokeWeight(1);
  float x, y;
  float noiseVal = random(10);
  float radVariance, thisRadius, rad;
  
  beginShape();
  fill(20, 50, 70, 50);
  for( float ang = 0; ang <= 1440*10; ang += 1 ) {
    
    noiseVal += 0.1;
    radVariance = 50 * customNoise(noiseVal);
    
    thisRadius = radius + radVariance;
    rad = radians(ang);
    x = centX + thisRadius * cos(rad);
    y = centY + thisRadius * sin(rad);
    
    curveVertex(x, y);
  }
  endShape();
}

float customNoise( float value ){
  return pow(sin(value), 3);
}
