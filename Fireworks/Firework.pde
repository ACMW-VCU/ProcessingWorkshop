
class Firework{
  
  ArrayList<Particle> particles;

  PVector pos;
  PVector vel;
  PVector acc;
  
  boolean exploded;
  
  float h;
  
  Firework(float h){
  
    pos = new PVector(random(width), height);
    vel = new PVector(0, random(-15, -6));
    acc = new PVector(0, 0);
    exploded = false;
    particles = new ArrayList();
    
    this.h = h;
  
  }
  
  void explode(){
    
    exploded = true;
    
    for(int i = 0; i < 100; i++){
      particles.add(new Particle(pos, h));
    } 
  }
  
  void applyForce(PVector force){
    acc.add(force);
    
    for(Particle a : particles){
      a.applyForce(force);
    }
    
  }
  
  void update(){
  
    pos.add(vel);
    vel.add(acc);
    
    acc.mult(0);
    
    for(Particle p : particles){
      p.update();
      
    }
    
  
  }
  
  void show(){
  
    if(!exploded){
      stroke(h, 255, 255);
      strokeWeight(8);
      point(pos.x, pos.y);
    }
    
    for(Particle b : particles){
      b.show();
    }
    
  
  }
  
}