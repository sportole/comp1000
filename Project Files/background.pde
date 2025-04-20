class Background {
  color bgColor;

  Background() {
    bgColor = #71C449;  // intial background color
  }

  void display() {
    background(bgColor);  // display the current background color
    for (int i = 100; i<=1000; i+=200) {  //clouds 
      if (i%2==0) {
        fill(255);  
        noStroke();
        ellipse(i, 100, 90, 60);
        ellipse(i + 20, 90, 90, 70);
        ellipse(i + 40, 100, 90, 60);
      }
    }
  }

  void changeColor() {
    bgColor = color(random(255), random(255), random(255));  // generates random color
  }
}
