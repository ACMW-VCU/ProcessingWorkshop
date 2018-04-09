
class Particle{

  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed = 5;
  float hue = random(255);
  
  Particle(){
  
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  
  }
  
  void follow(PVector[] forces){
  
    if(pos.x < width && pos.y < height){
      int x = floor(pos.x/scl);
      int y = floor(pos.y/scl);
    
      int index = x + y * cols;
    
      PVector force = forces[index];
      applyForce(force);
    }

  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void update(){
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
    
    vel.limit(maxSpeed);
    
    if(pos.x > width) pos.x = 0;
    if(pos.x < 0) pos.x = width;
    if(pos.y > height) pos.y = 0;
    if(pos.y < 0) pos.y = height;
  }
  
  void show(){
    stroke(hue, 255, 255, 5);
   // stroke(0, 5);
    strokeWeight(5);
    point(pos.x, pos.y);
  
    hue += 1;
    if(hue > 255){
      hue = 0;
    }
    
  }
}