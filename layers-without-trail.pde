//andere tekst
PGraphics bg, fg;

void setup() {
  size(400, 400);
  bg = createGraphics(400, 400); //background
  fg = createGraphics(400, 400); //foreground
}

void draw() {
  background(240);

  //visual with trail
  bg.beginDraw();
  bg.pushMatrix();
  bg.translate(width/2, height/2);
  bg.rotate(radians(frameCount));
  bg.rect(0, 0, 100, 100);
  bg.popMatrix();
  bg.endDraw();

  //use clear() for no trail:
  fg.beginDraw();
  fg.clear();
  fg.fill(0, 255, 0);
  fg.ellipse(mouseX, mouseY, 20, 20);
  fg.endDraw();

  image(bg, 0, 0);
  image(fg, 0, 0);
}
