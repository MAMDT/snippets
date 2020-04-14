float sensorValueSum = 0;
float sensorValue;
float sensorValueAverage=0;
float sensorValueCounting;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  sensorValue = random(50);
  strokeWeight(5);
  line(50,0,50, sensorValue*5);
  line(100,0,100, sensorValueAverage*5);
  
  sensorValueSum =  sensorValueSum + sensorValue;
  sensorValueCounting++; 
  sensorValueAverage =  sensorValueSum / sensorValueCounting; 

  if (sensorValueCounting==100) {
    
    println(sensorValueAverage);
    sensorValueCounting = 0; 
    sensorValueAverage = 0; 
    sensorValueSum =  0;
  }
}