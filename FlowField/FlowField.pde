
float scl = 10;

int cols;
int rows;

float zoff = 0;

PVector[] flowfield;
ArrayList<Particle> particles;

void setup(){

  size(1000, 1000);
  colorMode(HSB);
  stroke(0);
  background(255);
  
  cols = floor(width/scl);
  rows = floor(height/scl);
  
  flowfield = new PVector[rows * cols];
  particles = new ArrayList();
  
  for(int i = 0; i < 10000; i++){
    particles.add(new Particle());
  }
  
}

void draw(){
 //background(255);
  float yoff = 0;
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      int index = x + y * cols;
      
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 4;
      PVector v = PVector.fromAngle(angle);
      v.setMag(1);
      
      flowfield[index] = v;
      
      //pushMatrix();
      //translate(x*scl, y*scl);
      //rotate(v.heading());
      //stroke(0, 255);
      //strokeWeight(1);
      //line(0, 0, scl, 0);
      //popMatrix();
      
     xoff += 0.05; 
    }
    yoff += 0.05;
  }
  zoff += 0.002;
  
  for(Particle p : particles){
    p.update();
    p.show();
    p.follow(flowfield);
  }
}