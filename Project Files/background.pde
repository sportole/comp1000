class Background {
  color bgColor;  
  
  Background() {
    bgColor = #71C449;  // intial background color
  }

  void display() {
    background(bgColor);  // display the current background color
  }

  void changeColor() {
    bgColor = color(random(255), random(255), random(255));  // generates random color
  }
}
