import processing.serial.*;
Serial myPort;
int lf = 10;
float ellipseSize;

void setup() {
  size(650, 650);
  myPort = new Serial(this, "/dev/cu.usbmodem1444101", 9600);
}

void draw() {
  background(0);

  while (myPort.available() > 0) {
    String myString = myPort.readStringUntil(lf);
    if (myString != null) {
      //println(myString);
      int koppelTeken = myString.indexOf(":");
      if (koppelTeken > 0) {
        String mySensor = myString.substring(0, koppelTeken);
        String myData = myString.substring(koppelTeken + 1, myString.length()-1);
        
        println(mySensor);
        myData.trim();
        if (mySensor.equals("draaiknop1")) {
          ellipseSize = float(myData);
        }
      }
    }
  }

  fill(255, 0, 0);
  ellipse(width/2, height/2, ellipseSize, ellipseSize);
}

void mousePressed(){
  myPort.write("lampje:" + mouseX);
}
