// when scaling webcam video, the webcam ratio needs to be persistent
// videoWidth and videoHeight therefor need to be exact integers (not floats) in a ratio 16:9 (with a 16:9 webcam)

import processing.video.*;
Capture video;

int videoWidth;
int videoHeight;
// set a multiplier to create a padding of 16 * multiplier around all edges
int multiplier = 6;

void setup() {
  //size(displayWidth,displayHeight);
  fullScreen();
  videoWidth = width - (16 * multiplier);
  videoHeight = videoWidth / 16 * 9;
  video = new Capture(this, videoWidth, videoHeight);
  video.start();
}

void draw () {
  background(255);
  
  // flip video
  pushMatrix();
  scale(-1, 1);
  translate(-video.width, 0);
  image(video, -(width-videoWidth)/2, (height-videoHeight)/2);
  popMatrix();
}

void captureEvent(Capture video) {
  video.read();
}
