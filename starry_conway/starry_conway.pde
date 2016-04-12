PImage background;

int GRID_W = 128;
int GRID_H = 128;

float s_w;
float s_h;

int[][] conway_grid = new int[GRID_W][GRID_H];
int[][] conway_grid_copy = new int[GRID_W][GRID_H];
int[][] conway_neighbours = new int[GRID_W][GRID_H];

void setup () {
  background = loadImage("starry.jpg");

  size(1280, 1024);
  s_w = width / GRID_W;
  s_h = height / GRID_H;
  
  // set up the seed for the grid
  for (int i = 0; i < GRID_W; ++i) {
    for (int j = 0; j < GRID_H; ++j) {
      conway_grid[i][j] = random(10) > 8 ? 1 : 0;
    }
  }
  
  fill(255);
  noStroke();
}

void draw () {
  background(0);
  
  // calculate conway_grid weights
  for (int i = 0; i < GRID_W - 1; ++i) {
    for (int j = 0; j < GRID_H - 1; ++j) {
      int neighbours = 0;
      
      try {
        if (conway_grid[i-1][j] == 1) neighbours += 1;
        if (conway_grid[i-1][j-1] == 1) neighbours += 1;
        if (conway_grid[i-1][j+1] == 1) neighbours += 1;
        if (conway_grid[i+1][j] == 1) neighbours += 1;
        if (conway_grid[i+1][j+1] == 1) neighbours += 1;
        if (conway_grid[i+1][j-1] == 1) neighbours += 1;
        if (conway_grid[i][j-1] == 1) neighbours += 1;
        if (conway_grid[i][j+1] == 1) neighbours += 1;
      } catch (IndexOutOfBoundsException e) {}
      
      conway_neighbours[i][j] = neighbours;
      
      if (conway_grid[i][j] == 1) {
        if (neighbours == 2 || neighbours == 3) {
          conway_grid_copy[i][j] = 1;
        } else {
          conway_grid_copy[i][j] = 0;
        }
      } else {
        if (neighbours == 3) {
          conway_grid_copy[i][j] = 1;
        }
      }
    }
  }
  
  // draw
  for (int i = 0; i < GRID_W - 1; ++i) {
    for (int j = 0; j < GRID_H - 1; ++j) {
      conway_grid[i][j] = conway_grid_copy[i][j];
      
      color c = background.get(
        int((i + 1) * s_w), int((j + 1) * s_h)
      );
      
      //fill (conway_neighbours[i][j] * 32);
      fill (c.red, c.green, c.blue, conway_neighbours[i][j] * 32);
      ellipse(
        (i + 1) * s_w, (j + 1) * s_h,
        s_w, s_h
      );
    }
  }
}