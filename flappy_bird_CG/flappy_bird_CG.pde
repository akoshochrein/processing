
float madarY;
float madarSebesseg;
float gravitacio = 0.1;

float[] csoX;
float csoVastagsag = 40;
float csoSebesseg = 1.0;

PImage madar;

void setup() {
  size(400,400);
  madar = loadImage("red-angry-bird.png");
  keszitsdEloACsoveket();
}

void keszitsdEloACsoveket() {
  csoX = new float[10];
  for( int i = 0; i < csoX.length; i++ ) {
    csoX[i] = width + i * 200;
  }
}

void draw() {
  if( nemVesztettunk() ) {
    background(0);
    rajzoljCsovet();
    rajzoljMadarat();
  } else {
    // veszitettem
  }
}

boolean nemVesztettunk() {
  return madarY < height; 
}

void rajzoljMadarat() {
  image(madar, 0, madarY);
  madarSebesseg += gravitacio;
  madarY += madarSebesseg;
}

void rajzoljCsovet() {
  fill(145, 255, 145);
  for( int i = 0; i < csoX.length; i++ ) {
    rect(csoX[i], 0, csoVastagsag, height);
    csoX[i] -= csoSebesseg;
  }
}

void keyPressed() {
  madarSebesseg -= 5.0;
}

