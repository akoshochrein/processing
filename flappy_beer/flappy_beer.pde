
float sorY = 0.0;
float sorSebesseg;
float gyorsulas = 0.1;
PImage sor;

float[] csoX;
float csoSzelesseg = 20.0;
float csoSebesseg = -2.0;

void setup() {
  size(400,400);
  sor = loadImage("BTG1WH_1.jpg");
  keszitsdEloACsoveket();
}

void keszitsdEloACsoveket() {
  csoX = new float[3];
  for( int i = 0; i < 3; ++i ) {
    csoX[i] = width + i * 200;
  }
}

void draw() {
  if( vesztettunk() ) {
    vesztettKepernyo();
  } else {
    background(0);
    rajzoljSort();
    rajzoljCsovet();
  }
}

void keyPressed() {
  sorSebesseg -= 5.0;
}

void rajzoljSort() {
  sorSebesseg += gyorsulas;
  sorY += sorSebesseg;
  image(sor, 0.0, sorY);
}

void rajzoljCsovet() {
  fill( 78, 230, 78 );
  for( int i = 0; i < 3; ++i ) {
    csoX[i] += csoSebesseg;
    rect( csoX[i], 0.0, csoSzelesseg, height );
  }
}

boolean vesztettunk() {
  return sorY > height;
}

void vesztettKepernyo() {
  fill( 255 );
  textSize(40);
  textAlign(CENTER);
  text("Game Over", width/2, height/2 );
}
