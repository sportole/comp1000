Owl coolOwl;
Background bg;

void setup() {
  size(800, 600);
  noStroke();
  coolOwl = new Owl(width/2, height/2,0.5);
  bg = new Background();
}

void draw() {
  bg.display();
  coolOwl.display();
  coolOwl.movement();
}

void keyPressed(){
  coolOwl.keyPressed();
}

void keyReleased(){
  coolOwl.keyReleased();
}


void mousePressed() {
  bg.changeColor();
}
