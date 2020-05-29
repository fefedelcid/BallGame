class Player {
  float r = 25 * displayDensity();
  PVector pos = new PVector(width/2, height/2);
  PVector vel = new PVector();

  void show() {
    noStroke();
    fill(0, 255, 0);
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  void update() {
    pos.add(vel);
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.y > height) {
      pos.y = 0;
    } else if (pos.y < 0) {
      pos.y = height;
    }
  }
}
