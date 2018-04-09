
float gravity;

Drop[] drops;
int numOfDrops;

void setup() {
  size(600, 600);
    
  gravity = 0.1;
  numOfDrops = 300;
  drops = new Drop[numOfDrops];
  
  for (int i = 0; i < numOfDrops; i++) {
    drops[i] = new Drop(); 
  }
}

void draw() {
  background(255);
  
  for (Drop d : drops) {
    d.update();
    d.show();
  }
}