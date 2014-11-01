
float rectX[] = new float[100];
float rectY[] = new float[100];
float sebX[] = new float[100];
float sebY[] = new float[100];

float a = 40;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  
  for(int i = 0; i < rectX.length; ++i) {
    rectX[i] = random(a/2, width - a/2);
    rectY[i] = random(a/2, height - a/2);
    sebX[i] = random(-5, 5);
    sebY[i] = random(-5, 5);
  }
}

void draw() {
  fill(255, 127, 0, 51);
  rect(width / 2 , height / 2, width, height);
  for(int i = 0; i < rectX.length; ++i) {
    rect(rectX[i], rectY[i], a, a);
    rectX[i] += sebX[i];
    rectY[i] += sebY[i];
    
    if(rectX[i] > width - a/2 || rectX[i] < a/2) {
      sebX[i] *= -1;
    }
    
    if(rectY[i] > height - 20 || rectY[i] < 20) {
      sebY[i] *= -1;
    }
  }
}
