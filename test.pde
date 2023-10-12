import ddf.minim.*; 

Minim minim;
AudioInput in;
boolean isSquare = true;

void setup() {
  size(1200, 1100, P3D); 
  surface.setLocation(0, 0); 
  frameRate(100); 
  smooth();
  stroke(0); 
  strokeWeight(1);
  noFill(); 
  minim = new Minim(this); 
  in = minim.getLineIn(Minim.MONO, 2048); 
}

void draw() { 
  background(0);
  if (isSquare) {
    squarefunc();
  } else {
    spherefunc();
  }
}

void squarefunc() {
  float vol = in.mix.level();
  float r = map(vol, 0.3, 3.0, 5, width/7); 
  r *= 30; // 正方形の大きさを2倍にする
  stroke(random(255), random(255), random(255));
  fill(random(255), random(255), random(255));
  translate(width/2, height/2, -100); 
  rotateX(frameCount * 0.01); 
  rotateY(frameCount * 0.01); 
  box(r); 
  strokeWeight(random(0.3, 9));
}

void spherefunc() {
  float vol = in.mix.level();
  float r = map(vol, 0.3, 3.0, 5, width/7);
  r *= 20; 
  r = min(r, 100); 
  stroke(random(255), random(255), random(255));
  fill(random(255), random(255), random(255));
  translate(width/2, height/2, -100); 
  rotateX(frameCount * 0.01); 
  rotateY(frameCount * 0.01); 
  sphere(r); 
  strokeWeight(random(0.3, 9));
}

void mouseClicked() {
  isSquare = !isSquare; 
}
