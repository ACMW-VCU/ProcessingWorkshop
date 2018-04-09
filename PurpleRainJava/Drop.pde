
class Drop {
  
  PVector pos;
  PVector vel;
  PVector acc;

  Drop() {
    pos = new PVector(random(width), random(-600, 0));
    vel = new PVector(0, random(6, 12));
    acc = new PVector(0, gravity);
  }
  
  void update() {
    pos.add(vel);
    vel.add(acc);
    
    if (pos.y >= height) {
      vel.mult(0);
      pos = new PVector(random(width), 0);
      vel = new PVector(0, random(5, 12));
    }
  }
  
  void show(){
    fill(255, 0, 255);
    noStroke();
    rect(pos.x, pos.y, 2, 10);
  }
}