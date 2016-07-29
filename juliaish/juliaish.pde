float TOP_TRESHOLD = 1.0f;
float BOTTOM_TRESHOLD = -1.0f;

void setup () {
  size(500, 400);
  
  // Do the Julia shenanigans
  int[][] iterationMatrix = new int[width][height];
  for (int c = 0; c < width; ++c) {
    for (int r = 0; r < height; ++r) {
      float x = map(c, 0, width, -1, 1);
      float y = map(r, 0, height, -1, 1);
      iterationMatrix[c][r] = doJulia(new Complex(x, y));
    }
  }
  
  // Get the borders from the mx
  int maxJuliaValue = -1;
  int minJuliaValue = 999999;
  for (int c = 0; c < width; ++c) {
    for (int r = 0; r < height; ++r) {
      if (iterationMatrix[c][r] < minJuliaValue) minJuliaValue = iterationMatrix[c][r];
      if (iterationMatrix[c][r] > maxJuliaValue) maxJuliaValue = iterationMatrix[c][r];
    }
  }
  
  // Draw, bitch
  for (int c = 0; c < width; ++c) {
    for (int r = 0; r < height; ++r) {
      stroke(
        map(iterationMatrix[c][r], minJuliaValue, maxJuliaValue, 0, 255)
      );
      point(c, r);
    }
  }
}

int doJulia(Complex c) {
  int currentIteration = 0;
  Complex copyC = c.copy();
  while (
    copyC.real < TOP_TRESHOLD && copyC.real > BOTTOM_TRESHOLD &&
    copyC.imaginary < TOP_TRESHOLD && copyC.imaginary > BOTTOM_TRESHOLD
  ) {
    ++currentIteration;
    copyC = copyC.multiply(copyC).add(new Complex(0.221, 0.713));
  }
  return currentIteration;
}

class Complex {
  float real;
  float imaginary;
  
  Complex (float real, float imaginary) {
    this.real = real;
    this.imaginary = imaginary;
  }
  
  Complex multiply (Complex c) {
    return new Complex(
      this.real * c.real - this.imaginary * c.imaginary,
      this.imaginary * c.real + this.real * c.imaginary
    );
  }
  
  Complex add (Complex c) {
    return new Complex(
      this.real + c.real, this.imaginary + c.imaginary
    ); 
  }
  
  Complex copy () {
    return new Complex(this.real, this.imaginary);
  }
}