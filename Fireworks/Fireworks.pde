
PVector gravity;
float hue;

ArrayList<Firework> fireworks;

void setup(){

  fullScreen();
 // background(0);
  colorMode(HSB);
  
  gravity= new PVector(0, 0.1);
  fireworks = new ArrayList();
  
  hue = 0;

}

void draw(){

  background(0);
  
  if(random(1) < 0.09){
    fireworks.add(new Firework(hue));
  }

  for(int i = fireworks.size() - 1; i >= 0; i--){
    Firework f = fireworks.get(i);
    f.applyForce(gravity);
    f.show();
    f.update();
    
    if(!f.exploded){
      if(f.vel.y > -0.2 && f.vel.y < 0.2){
        f.explode();
      }
    }
    
    if(f.pos.y > height){
      fireworks.remove(f);
    }
    
  }
  
  hue += 5;
  
  if(hue > 255){
     hue = 0;
  }
  
}