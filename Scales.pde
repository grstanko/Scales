void setup() {
  size(500, 500, P3D);
}

// translate( Left Right , forward background, Makes Closer);

float rotX = 0.0f;
float rotY = 0.0f;
float rotZ = 0.0f;

int r = 0;

void draw() {
  if (frameCount % 60 == 0) {
    r += 1;
    if (r >= 3) r=0;
  }

  
  rotY = ((float)(mouseX - (width/2))) / 2;
  rotX = ((float)(mouseY - (height/2))) / 2;
  background(51);

  lights();

  translate(height/2, width/2, -50);
  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));


  translate(200, 200, 200);
  fill(#ffffff);
  box(10, 10, 10);
  translate(-200, -200, -200);

  pushMatrix();

  int offset = 0;

  translate(-100, -100, 0);
  for (int y = 0; y < 200; y += 20) {
    offset = (~offset) & 0b1;
    translate(20 , 0, 0);
    if (offset == 0) {
      translate(0, 10, 0);
    } else {
      translate(0, -10, 0);
    }
    for (int x = 0; x < 200; x += 20) {
      translate(0, 20, 0);
      scale(x,y);
    }
    translate(0, -200, 0);
  }

  popMatrix();


  noLights();
  fill(#FF0000);
  noStroke();
  box(2.0f,2.0f,1000000);
  fill(#00FF00);
  rotateX(radians(90));
  box(2.0f,2.0f,1000000);
  rotateY(radians(90));
  fill(#0000FF);
  box(2.0f,2.0f,1000000);

  switch (r) {
  }
}

void scale(int x, int y) {
  sphere(5);
  pushMatrix();

  rotateX(radians((float)(Math.random() - 0.5d))*20);

  rotateY(radians(-15));
  triangle(0, 0, 20, -10, 20, 10);
  rotateY(radians(-150));

  triangle(0, 0, 20, -10, 20, 10);
  popMatrix();
}
