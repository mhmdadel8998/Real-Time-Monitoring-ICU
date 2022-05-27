#include <ArduinoJson.h>
#include "DHT.h"
#define DHTPIN 2 
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);
float h;
float t;
const byte numChars = 3;
char receivedChars[numChars];  // an array to store the received data
boolean newData = false;
String sensorValues ;
String objectString = " ";
bool senosr1Active = true ;
bool senosr2Active = true ;

void setup() {
  // put your setup code here, to run once:
  dht.begin();
  Serial.begin(38400);

}

void loop() {
rial.println('/');
delay(2500);
 h = dht.readHumidity();
 t = dht.readTemperature();
// recvFromEsp();
 collectSensorData();
 delay(3000);

}
void collectSensorData() {
  const size_t CAPACITY = JSON_OBJECT_SIZE(3);
  StaticJsonDocument<CAPACITY> doc;
  // create an object
  JsonObject object = doc.to<JsonObject>();
  object["ID"] = 0;
  if (senosr1Active) {
    object["TEMP"] = t;
  }
  if (senosr2Active) {
    object["humidity"] = h;
  }
  sensorValues = " " ;
  serializeJson(doc, sensorValues);
  Serial.println(sensorValues);
}
void recvFromEsp() {
  static byte ndx = 0;
  char endMarker = '\n';
  char rc;

  while (Serial.available() > 0 && newData == false) {
    rc = Serial.read();
    if (rc != endMarker) {
      receivedChars[ndx] = rc;
      ndx++;
      if (ndx >= numChars) {
        ndx = numChars - 1;
      }
    }
    else {
      receivedChars[ndx] = '\0'; // terminate the string
      ndx = 0;
      newData = true;
    }
  }
}
