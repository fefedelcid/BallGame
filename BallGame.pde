Joystick joystick;
Player player;

void setup() {
  orientation(LANDSCAPE);
  size(800, 400);
  joystick = new Joystick();
  player = new Player();
}

void draw() {
  background(51);
  line(width/2, 0, width/2, height);

  if (joystick.exist) {
    joystick.show();
    joystick.sendVel(player);
  }

  player.update();
  player.show();
}

void mousePressed() {
  if (mouseX <= width/2) {
    joystick.exist = true;
    joystick.posA = new PVector(mouseX, mouseY);
    joystick.posB = new PVector(mouseX, mouseY);
  }
}

void mouseReleased() {
  joystick.exist = false;
  player.vel = new PVector();
}

void mouseDragged() {
  float d;
  d = dist(joystick.posA.x, joystick.posA.y, mouseX, mouseY);

  if (d <= joystick.r){
    joystick.posB = new PVector(mouseX, mouseY);
  } else {
    float x = mouseX-joystick.posA.x;
    float y = mouseY-joystick.posA.y;
    PVector m = new PVector(x, y).normalize();
    m.setMag(joystick.r);
    m.add(joystick.posA);
    joystick.posB = new PVector(m.x, m.y);
  }
}
