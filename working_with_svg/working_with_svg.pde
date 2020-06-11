color[][] colors = {  //<>//
  {color(204, 0, 102), color(255, 153, 204)},
  {color(0, 102, 204), color(153, 204, 255)},
  {color(204, 204, 0), color(255, 255, 153)}
};

PShape piano;
PShape toetsc;
PShape toetsd;
PShape toetse;
PShape toetsf;
PShape toetsg;
PShape toetsa;
PShape toetsb;
PShape toetsdb;
PShape toetsfb;
PShape toetsgb;
PShape toetsab;
PShape toetsbb;

void setup() {
  size(700, 700);

  piano = loadShape("toetspiano.svg");
  toetsc = piano.getChild("ToetsC");
  toetsb = piano.getChild("ToetsB");
  toetsd = piano.getChild("ToetsD");
  toetse = piano.getChild("ToetsE");
  toetsf = piano.getChild("ToetsF");
  toetsg = piano.getChild("ToetsG");
  toetsa = piano.getChild("ToetsA");
  toetsab = piano.getChild("Ab");
  toetsbb = piano.getChild("Bb");
  toetsgb = piano.getChild("Gb");
  toetsfb = piano.getChild("Fb");
  toetsdb = piano.getChild("Db");

  toets(toetsc);
  toets(toetsd);
  toets(toetse);
  toets(toetsf);
  toets(toetsg);
  toets(toetsa);
  toets(toetsb);
  toets(toetsbb);
  toets(toetsab);
  toets(toetsgb);
  toets(toetsfb);
  toets(toetsdb);

  pushMatrix();
  piano.disableStyle();
  fill(255);
  shape(piano, width-250, height-200, 200, 150);
  popMatrix();
}

void toets(PShape toetsje) {
  pushMatrix();
  translate(random(0, 50), random(0, 50));
  rotate(random(-0.5,0.5));
  toetsje.disableStyle();
  fill(colors[int(random(0, 3))][int(random(0, 1))]);
  stroke(0);
  shape(toetsje, 100, 100);
  popMatrix();
}
