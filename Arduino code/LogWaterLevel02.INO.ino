// SensorPIN      Colour          ArduinoPIN   Colour
//       GND      Orange          GND          Brown 
//       VCC      OrangeWhite     5V           Red       
//       Trigger  Blue            5            Yellow 
//       Echo     BlueWhite       6            Orange
//

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

// defines pins numbers
const int trigPin = 5;
const int echoPin = 6;
const int numReadings = 10;
 
// defines variables
long duration;
float distance;
float Mdistance;
float mm;
float readings[numReadings];      // the readings from the analog input
int readIndex = 0;              // the index of the current reading
float total = 0;                  // the running total
float average = 0;                // the average
float actual = 0;                // the actual water level
long  litres;
long maximum = 2085;

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
  // initialize the array of readings to 0:
  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;
  } 
  
  // start the Ethernet connection
  
   Ethernet.begin(mac, ip, myDns);
     // give the ethernet module time to boot up:
  delay(1000);

  // print the Ethernet board/shield's IP address for debugging
  Serial.print("My IP address: ");
  Serial.println(Ethernet.localIP());
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
  // subtract the last reading:
  total = total - readings[readIndex];
  // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds

  duration = pulseIn(echoPin, HIGH);
  mm = duration/29/0.2;

  total = total + mm;
  // advance to the next position in the array:
  readIndex = readIndex + 1;

  // if we're at the end of the array...
  if (readIndex >= numReadings) {
    // ...wrap around to the beginning:
     readIndex = 0;
  }

   // calculate the average:
   average = total / numReadings;
   actual = maximum - average;


  Serial.print("water is ");
  Serial.print(mm);
  Serial.println(" mm below the sensor");
  litres = actual * 21.8023255814;
  Serial.print("There are ");
  Serial.print(litres);
  Serial.println(" litres of water in the tank ");
  total = 0;
  Serial.println("data read");
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
