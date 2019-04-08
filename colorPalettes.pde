color[][] kleuren;
int paletteSelector = 0;
int kleurSelector = 2;

void setup() {
  size(500,500);
  //2 = aantal paletten
  //5 = aantal kleuren per pallet
  kleuren = new color[2][5];

  //palette 1
  kleuren[0][0] = color(244, 74, 2);
  kleuren[0][1] = color(0, 159, 56);
  kleuren[0][2] = color(185, 216, 0);
  kleuren[0][3] = color(107, 107, 107);
  kleuren[0][4] = color(136, 204, 202);

  //palette 2
  kleuren[1][0] = color(12, 39, 59);
  kleuren[1][1] = color(35, 58, 89);
  kleuren[1][2] = color(167, 173, 179);
  kleuren[1][3] = color(230, 255, 253);
  kleuren[1][4] = color(254, 195, 47);
}

void draw(){
  background(255);
  noStroke();
  fill(kleuren[paletteSelector][kleurSelector]);
  ellipse(width/2, height/2, 30,30);
  
  textSize(14);
  text("palette :" + paletteSelector, 50,50);
  text("kleur :" + kleurSelector, 50,70);
}

void keyPressed(){
  paletteSelector = int(random(2));
  kleurSelector = int(random(5));
}
