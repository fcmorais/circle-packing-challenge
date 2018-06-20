  class Circle {
  float x;
  float y;
  float r;
  
  boolean growing = true;
  
  Circle(float _x, float _y) {
    x = _x;
    y = _y;
    r = 1;
  }
  
  Circle() {}
  
  void show() {
    stroke(255);
    noFill();
    ellipse(x,y,r*2, r*2);
  }
  
  void grow() {
    if(growing)
      r++;
  }
  
  boolean edge() {
    return (x+r > width || x - r < 0 || y+r > height || y-r < 0);
  }
  
}
