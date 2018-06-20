Circle c;

ArrayList<Circle> cs;
ArrayList<PVector> spots;
PImage img;


Circle createCircle() {
  
  int r = int(random(0,spots.size()));
  
  PVector spot = spots.get(r);
  
  float x = spot.x;
  float y = spot.y;
  boolean valid = true;

  for (Circle c : cs) {
    float d = dist(x, y, c.x, c.y);
    if (d < c.r +2) {
      valid = false;
      break;
    }
  }
  if (valid) {
    return (new Circle (x, y));
  } else {
    return null;
  }
}

void setup() {
  size(1366, 768);
  cs = new ArrayList<Circle>();
  spots = new ArrayList<PVector>();
  img = loadImage("dorf.jpg");
  img.loadPixels();
  for(int x = 0; x < img.width; x++){
    for (int y = 0; y < img.height; y++) {
      int index = x + y * img.width;
      color c = img.pixels[index];
      float b = brightness(c);
      if (b > 1) {
        spots.add(new PVector(x,y));
      }
    }
  }
}

void draw() {
  background(0);

  int total = 10;
  int count = 0;
  int attempts = 0;

  while (count < total) {
    Circle nc = createCircle();
    if ( nc != null) {
      cs.add(nc);
      count++;
    }
    attempts++;
    if (attempts > 1000) {
      noLoop();
      println("FIM");
      break;
    }
  }

  for (Circle c : cs) {
    if (c.growing) {
      if (c.edge()) {
        c.growing = false;
      } else {
        for (Circle oc : cs) {
          if (c != oc) {
            float d = dist(c.x, c.y, oc.x, oc.y);
            if (d-1< c.r + oc.r) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.show();
    c.grow();
  }
}
