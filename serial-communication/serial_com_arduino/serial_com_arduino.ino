float curVal;
float prevVal;
int lf = 10;

void setup() {
  Serial.begin(9600);
  pinMode(11,OUTPUT);
}

void loop() {
  curVal = analogRead(A0);

  if (curVal != prevVal) {
    Serial.print("draaiknop1");
    Serial.print(":");
    Serial.println(curVal);
    Serial.flush();
  }

  if (Serial.available() > 0) {
    String myString = Serial.readStringUntil(lf);

    int koppelTeken = myString.indexOf(":");
    String mySensor = myString.substring(0, koppelTeken);
    String myData = myString.substring(koppelTeken + 1);

    if (mySensor == "lampje") {
      int dataOmgezet = myData.toInt();
      if (dataOmgezet < 325) {
        digitalWrite(11,LOW);
      }
      if(dataOmgezet > 325){
        digitalWrite(11,HIGH);
      }
    }
    Serial.flush();
  }

  prevVal = curVal;
}
