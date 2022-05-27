
#if defined(ESP32)
#include <WiFi.h>
#include <FirebaseESP32.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#endif
#include <addons/TokenHelper.h>
#include <addons/RTDBHelper.h>
#define WIFI_SSID "WE_366484"
#define WIFI_PASSWORD "m5e02984"
#define API_KEY "AIzaSyAcyLutlH-Elp95X_2sf45JE3dTdtDIkWg"
#define DATABASE_URL "icu-task-default-rtdb.europe-west1.firebasedatabase.app" //<databaseName>.firebaseio.com or <databaseName>.<region>.firebasedatabase.app
#define USER_EMAIL "abdallah.azzam17@gmail.com"
#define USER_PASSWORD "38953034"
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;
unsigned long sendDataPrevMillis = 0;
unsigned long count = 0;

char state=' ';
String t;
String temperatue;
String h;
String humidity;

#include <ArduinoJson.h>

const byte numChars = 39;
char receivedChars[numChars];   // an array to store the received data
boolean newData = false;

void setup() {
  // put your setup code here, to run once:

  Serial.begin(38400);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);
  config.api_key = API_KEY;
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;
  config.database_url = DATABASE_URL;
  config.token_status_callback = tokenStatusCallback;
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
  Firebase.setDoubleDigits(5);
  
}

void loop() {
  // put your main code here, to run repeatedly
  delay(1000);
  recvFromArduino();
  delay(100);
  temperatue=get_temperatue();
  humidity=get_humidity();
Serial.printf("Set Temperature... %s\n", Firebase.setString(fbdo, F("/test/temperature"), temperatue) ? "ok" : fbdo.errorReason().c_str()); 
Serial.printf("Set Humidity... %s\n", Firebase.setString(fbdo, F("/test/humidity"), humidity) ? "ok" : fbdo.errorReason().c_str());
   FirebaseJson json;

    if (count == 0)
    {
      json.set("value/round/" + String(count), F("cool!"));
      json.set(F("vaue/ts/.sv"), F("timestamp"));
      Serial.printf("Set json... %s\n", Firebase.set(fbdo, F("/test/json"), json) ? "ok" : fbdo.errorReason().c_str());
    }
    else
    {
      json.add(String(count), "smart!");
      Serial.printf("Update node... %s\n", Firebase.updateNode(fbdo, F("/test/json/value/round"), json) ? "ok" : fbdo.errorReason().c_str());
    }
    Serial.println();
    count++;
  }
  
void recvFromArduino() {
  static byte ndx = 0;
  char endMarker = '\n';
  char rc;

  while (Serial.available() > 0 ) {
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
String get_temperatue(){
  int i=16;
  t=" ";
  for (i=16;i<=19;i++)
  {
    if(receivedChars[i]!= ','&&receivedChars[i]!= '"')
        {t+=receivedChars[i];}
        
   }
   return t;
  }
 String get_humidity(){
  int i=32;
  h=" ";
  for (i=32;i<=33;i++)
  {
    if(receivedChars[i]!= ','&&receivedChars[i]!= '}')
       
      {  h+=receivedChars[i]; }
      
   }
   return h;
  }
