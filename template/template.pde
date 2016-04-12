Canvas c;

void setup() {
  c = new Canvas(800, 600, 
    color(255, 255, 0)
  );
}

void draw() {
  c.refresh();
  ellipse(mouseX, mouseY, 50, 50);
}


class Canvas {
  color bg;
  int wid, heig;
  Canvas(int w, int h, color c) {
    wid = w;
    heig = h;
    bg = c;
    background(bg);
    size(wid, heig);
  }
  void refresh() {
    background(bg);
  }
}
