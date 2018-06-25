// SensorPIN      Colour          ArduinoPIN   Colour
//       GND      Orange          GND          Brown 
//       VCC      OrangeWhite     5V           Red       
//       Trigger  Blue            5            Yellow 
//       Echo     BlueWhite       6            Orange
//
// The maximum possible water in this tank is 38,227 litres.
// Based on interior measurements of 2600mm radius and 1800mm height to the bottom of the overflow
// The actual tank interior is 2600mm radius and 2200mm high giving a water rating of 46,721 litres
// This is not possible to achieve given that the overflow sits at 1800 above the floor of the tank


#include <SPI.h>
#include <Ethernet.h>

byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
 
// Assign IP address of this arduino
IPAddress ip(192,168,1,177);
// Assign IP address of Domain Name Server
IPAddress myDns(192, 168, 1, 1);

// initialize the library instance:
EthernetClient client;

// Assign IP address of LAMP Server
char server[] = "192.168.1.1";

// define pins numbers
const int trigPin = 5;
const int echoPin = 6;
 
// define variables
long duration;    // the time in microseconds for the signal to return to the sensor
float mm;
float waterLevel = 0; // the actual water level measured
long  litres;
long maximum = 2220; // Maximum possible distance from sensor to bottom of tank
float litresPerMillimetre = 21.237;

// last time we connected to the server, in milliseconds
unsigned long lastConnectionTime = 0; 

// DELAY BETWEEN UPDATES SET HERE:
// the "L" is needed to use long type numbers
//const unsigned long postingInterval = 60L * 1000L; // 1 minute for testing
const unsigned long postingInterval = 4L *60L * 60L * 1000L; // 4 hours - normal setting

void setup(void) {
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  Serial.begin(9600); // Starts the serial communication
  // start the Ethernet connection
  Ethernet.begin(mac, ip, myDns);
  // give the ethernet module time to boot up:
  delay(1000);
  // print the Ethernet board/shield's IP address for debugging
  Serial.print("My IP address: ");
  Serial.println(Ethernet.localIP());
  getData(); //check that the sensor is working by printing data to serial port
  } // END SETUP

void loop(void) {

 // if there's incoming data from the web server.
   // send it out the serial port.  
    if (client.available()) 
          {
      char c = client.read();
      Serial.write(c);
          }
 // if the programmed wait period has passed since our last connection,
    // we need to get data from the sensor and post it to the web server again
    if (millis() - lastConnectionTime > postingInterval) 
          {
            getData();
            saveData();
    }
} // END LOOP


// This method queries the sensor 
void getData(void)
{
  // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  mm = duration/2.9/2;
  waterLevel = maximum - mm;
  Serial.print("water is ");
  Serial.print(mm);
  Serial.println(" mm below the sensor");
  Serial.print("Actual level of water in the tank is ");
  Serial.print(waterLevel);
  Serial.println(" mm");
  litres = waterLevel * litresPerMillimetre;
  Serial.print("There are ");
  Serial.print(litres);
  Serial.println(" litres of water in the tank ");
} 

////////////////////////////////////////////////////////////////////
void saveData() 
{
  // close any connection before sending a new request.
  // This will free the socket on the ethernet connection
  client.stop();

  // if there's a successful connection:
  if (client.connect(server, 80)) 
  {
   // Serial.println("connecting...");
   // send the HTTP PUT request:
    client.print("GET /tankwater/insert.php?value=");
    client.println(litres);
    client.println(" HTTP/1.1");
    client.println("Host: 192.168.1.1");
    client.println("User-Agent: arduino-ethernet");
    client.println("Connection: close");
    client.println(); 
     // note the time that the connection was made:
    lastConnectionTime = millis();
  Serial.println("--> connection successful - data sent \n");
  }

  else {
    // If Arduino can't connect to the server
    Serial.println("--> connection to server failed\n");
  }
}
