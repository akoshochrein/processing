
float x, y, vy, vx, d;
color bg = #B23232;

float G = 0.3;

void setup () {
  size(800, 600);
  
  d = random(50, 70);
  x = random(d, width-d);
  vy = -20;
  vx = random(-5, 5);
  y = height + 200;
}

void draw () {
  background(bg);
  ellipse(x, y, d, d);
  x += vx;
  y += vy;
  vy += G;
  
  if (y > height + 200) {
    d = random(50, 70);
    x = random(d, width-d);
    vx = random(-5, 5);
    vy = -20;
  }
}

void mousePressed () {
  if (dist(mouseX, mouseY, x, y) < d/2) {
    y = height + 200;
    d = random(50, 70);
    x = random(d, width-d);
    vx = random(-5, 5);
    vy = -20;  
  }
}



