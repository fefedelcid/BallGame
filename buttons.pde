void create_buttons(){
  float _height = (height - 2 * margin - width) / 4;
  float _width = width / 3;

  up_button = new Button(
    _width, _height, _width, height-_height*2, _width*2, height-_height, 'W');
  left_button = new Button(
    _width, _height, 0, height-_height, _width, height, 'A');
  down_button = new Button(
    _width, _height, _width, height-_height, _width*2, height, 'S');
  right_button = new Button(
    _width, _height, _width*2, height-_height, width, height, 'D');
}


void show_buttons(){
  up_button.show();
  left_button.show();
  down_button.show();
  right_button.show();
}


class Button{
  PVector pos1, pos2;
  float _width, _height;
  char ch;
  boolean pressed = false;

  Button(float w, float h, float x1, float y1, float x2, float y2, char c){
    pos1 = new PVector(x1, y1);
    pos2 = new PVector(x2, y2);
    _width = w;
    _height = h;
    ch = c;
  }

  boolean is_pressed(float x, float y){
    boolean inner_x = x >= pos1.x && x <= pos2.x;
    boolean inner_y = y >= pos1.y && y <= pos2.y;

    if (inner_x && inner_y){
      pressed = true;
      return true;
    }
    return false;
  }

  void show(){
    if (!pressed) fill(25);
    else fill(75);
    stroke(0, 255, 0);
    rect(pos1.x + margin, pos1.y + margin, _width-margin, _height-margin);
    textSize(30 * displayDensity);
    textAlign(CENTER, CENTER);
    fill(0, 255, 0);
    text(ch, pos1.x+_width/2, pos1.y+_height/2);
    pressed = false;
  }
}


// PLAYER MOVEMENT
void mousePressed(){
  if (up_button.is_pressed(mouseX, mouseY)){
    player.pos.y -= CELL;
    if (player.pos.y < margin){
      player.pos.y = width - margin - CELL/2;
    }
  } else if (left_button.is_pressed(mouseX, mouseY)){
    player.pos.x -= CELL;
    if (player.pos.x < margin){
      player.pos.x = width - margin - CELL/2;
    }
  } else if (down_button.is_pressed(mouseX, mouseY)){
    player.pos.y += CELL;
    if (player.pos.y > width-margin){
      player.pos.y = margin + CELL/2;
    }
  } else if (right_button.is_pressed(mouseX, mouseY)){
    player.pos.x += CELL;
    if (player.pos.x > width-margin){
      player.pos.x = margin + CELL/2;
    }
  }

  if (player.hungry()) food.spawn();
}
