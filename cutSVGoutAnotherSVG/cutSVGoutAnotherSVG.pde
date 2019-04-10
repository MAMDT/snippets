import geomerative.*;

RShape sjabloon;
RPoint[] mypoints; 

void setup() {
  size(1000, 1000);
  RG.init(this);
 
  sjabloon = RG.loadShape("sjabloon.svg");
  println(sjabloon.countChildren());  //printen: hoeveel "kinderen/lagen" aanwezig
  
  //schalen naar 1/10
  sjabloon.scale(.1);
} 

void draw() {
  background(255,0,0);
  RShape subShape = sjabloon.children[0];
  //of
  //RShape subShape = sjabloon.getChild("naamlaag");
  mypoints = subShape.getPoints();
  
  fill(255);
  beginShape();
  //vierkant
    vertex(50,50);
    vertex(950,50);
    vertex(950,950);
    vertex(50,950);
  //je shape uitsnijden
    beginContour();
       for(int i=0; i<mypoints.length; i++){
         vertex(mypoints[i].x+mouseX, mypoints[i].y+mouseY);
        }
    endContour();
  endShape(CLOSE);
}
