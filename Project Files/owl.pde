class Owl {
  float owlX, owlY, groundY;
  float velocityX, velocityY;  // vertical and horizontal velocity
  boolean isHopping = false;
  float flapTimer = 0;  // flapping wings
  float sizeFactor;  // size of owl
  int lookDirection = 0;  // -1 for left, 1 for right, 0 for center

  Owl(float startX, float startY, float s) {
    owlX = startX;
    owlY = startY;
    groundY = owlY;
    velocityX = 0;
    velocityY = 0;
    sizeFactor = s;
  }

  void display() {
    pushMatrix();  // buffer start
    translate(owlX, owlY);
    scale(sizeFactor);
    translate(-owlX, -owlY);

    body();
    face();
    wings();
    legs();

    popMatrix();  // buffer end
  }

  void body() {
    fill(#735538);
    ellipse(owlX, owlY, 260, 300);  // main belly

    stroke(#a67a51);
    strokeWeight(10);
    strokeJoin(ROUND);
    triangle(owlX + 80, owlY - 230, owlX + 20, owlY - 170, owlX + 70, owlY - 170);  // right ear
    triangle(owlX - 80, owlY - 230, owlX - 70, owlY - 170, owlX - 20, owlY - 170);  // left ear

    noStroke();
    fill(#735538);
    arc(owlX, owlY + 115, 230, 120, 0, PI);  // tail
  }

  void face() {
    fill(#a67a51);
    circle(owlX - 40, owlY - 130, 125);  // outer left circle
    circle(owlX + 40, owlY - 130, 125);  // outer right circle

    fill(#e6e6e6);
    triangle(owlX - 50, owlY - 140, owlX + 50, owlY - 140, owlX, owlY - 55);  // beak

    fill(#e6e6e6);
    circle(owlX - 30, owlY - 130, 80);  // inner left eye
    circle(owlX + 30, owlY - 130, 80);  // inner right eye

    // Pupils
    fill(#4d4d4d);
    float pupilOffset = 5 * lookDirection;
    circle(owlX - 30 + pupilOffset, owlY - 130, 40);  // left pupil
    circle(owlX + 30 + pupilOffset, owlY - 130, 40);  // right pupil
  }

  void wings() {
    fill(#a67a51);
    float leftWingX = owlX - 110;
    float rightWingX = owlX + 110;

    pushMatrix();
    translate(leftWingX, owlY);
    if (flapTimer > 0)
      rotate(radians(20));
    ellipse(0, 0, 90, 160);
    popMatrix();

    pushMatrix();
    translate(rightWingX, owlY);
    if (flapTimer > 0) rotate(radians(-20));
    ellipse(0, 0, 90, 160);
    popMatrix();

    if (flapTimer > 0)
      flapTimer--;
  }

  void legs() {
    fill(#a67a51);
    rect(owlX - 80, owlY + 70, 30, 70, 50);
    rect(owlX - 50, owlY + 70, 30, 70, 50);
    rect(owlX + 20, owlY + 70, 30, 70, 50);
    rect(owlX + 50, owlY + 70, 30, 70, 50);
  }

  void movement() {
    if (isHopping) {
      owlY += velocityY;
      velocityY += 0.5;
      if (owlY >= groundY) {
        owlY = groundY;
        velocityY = 0;
        isHopping = false;
      }
    }
    owlX += velocityX;  // update owl's horizontal position
  }

  void keyPressed() {
    if (key == ' ') {
      velocityY = -10;
      isHopping = true;
      flapTimer = 25;
    } else if (keyCode == LEFT) {
      velocityX = -3;  // move left
      lookDirection = -1;  // look left
    } else if (keyCode == RIGHT) {
      velocityX = 3;  // move right
      lookDirection = 1;  // look right
    }
  }

  void keyReleased() {
    if (keyCode == LEFT || keyCode == RIGHT) {
      velocityX = 0;
      lookDirection = 0;
    }
  }
}   
