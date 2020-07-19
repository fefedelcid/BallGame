class Player {
  PVector pos = new PVector(width/2, width/2);

  void show() {
    pushMatrix();
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, CELL/2, CELL/2);
    popMatrix();
  }

  void update(int x, int y) {
    pos.add(new PVector(x, y));
    if (pos.x > width - margin) {
      pos.x = margin + CELL/2;
    } else if (pos.x < margin) {
      pos.x = width - margin - CELL/2;
    }
    if (pos.y > width - margin) {
      pos.y = margin + CELL/2;
    } else if (pos.y < margin) {
      pos.y = width - margin - CELL/2;
    }
  }

  boolean hungry(){
    float d = dist(pos.x, pos.y, food.pos.x, food.pos.y);
    if (d < CELL){
      return true;
    } else {
      return false;
    }
  }
}
