int CELL;
float margin;
Player player;
Food food;
Button up_button, left_button, down_button, right_button;

void setup() {
  orientation(PORTRAIT);
  // size(256, 512);
  CELL = floor(width/21);
  margin = (width-CELL*21)/2;
  player = new Player();
  food = new Food();
  food.spawn();
  create_buttons();
}


void draw() {
  background(51);
  noFill();
  noStroke();
  playground();
  lines();
  food.show();
  player.show();
  show_buttons();
}

// BACKGROUND
void playground() {
  pushMatrix();
  fill(170);
  stroke(0, 255, 0);
  rect(margin, margin, CELL*21, CELL*21);
  popMatrix();
}


// GRID GUIDE
void lines() {
  pushMatrix();
  stroke(255);
  for (int i = 0; i<22; i++){
    line(i*CELL + margin, margin, i*CELL + margin, width - margin);
    line(margin, i*CELL + margin, width - margin, i*CELL + margin);
  }
  popMatrix();
}
