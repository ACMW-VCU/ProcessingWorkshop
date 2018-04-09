
class Particle{

  PVector pos;
  PVector vel;
  PVector acc;
  
  float life;
  float hue;
  
  Particle(PVector position, float h){
  
    pos = position.copy();
    vel = PVector.random2D();
    vel.mult(random(1, 10));
    acc = new PVector();
    
    life = 255;
    hue = h;
  
  }  
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void update(){
    
    pos.add(vel);
    vel.add(acc);
    
    vel.mult(0.95);
    acc.mult(0);
    
    life -= 5;
  
  }
  
  void show(){
  
    stroke(hue, 255, 255, life);
    strokeWeight(3);
    point(pos.x, pos.y);
    
  }
}