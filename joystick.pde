class Joystick {
  PVector posA;
  PVector posB;

  float r = width/20 * displayDensity();
  boolean exist = false;

  void show() {
    noStroke();
    fill(255, 75);
    ellipse(posA.x, posA.y, r*2, r*2);
    fill(255, 150);
    ellipse(posB.x, posB.y, r, r);
  }

  void sendVel(Player player) {
    player.vel = posB.sub(posA);

    if (player.vel.mag() != 0){
      player.vel.mult(.1);
    }
  }
}
