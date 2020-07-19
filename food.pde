class Food{
  PVector pos;
  float dist;

  void spawn(){
    float x = margin + CELL/2 + CELL * floor(random(0, 21));
    float y = margin + CELL/2 + CELL * floor(random(0, 21));

    float dist = dist(player.pos.x, player.pos.y, x, y);

    if (dist <= CELL/2){
      spawn();
    } else {
      pos = new PVector(x, y);
    }
  }

  void show(){
    fill(255, 0, 0);
    stroke(0);
    noStroke();
    ellipse(pos.x, pos.y, CELL/2, CELL/2);
    // line(pos.x, pos.y, player.pos.x, player.pos.y);
    // text(dist(player.pos.x, player.pos.y, pos.x, pos.y), width/2, height/2);
    // text("\n"+str(CELL), width/2, height/2);
  }
}
