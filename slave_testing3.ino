#include <Servo.h>

// Pin definitions
#define BUTTON_PIN 8 // Pin connected to the button
#define MIC_PIN A6   // Pin connected to the microphone
#define SERVO_PIN A0 // Pin connected to the servo

// Create a Servo object
Servo myServo;

// Global variables
int flag = 0;        // Flag to control timing
int state0, state1, state2, state3, state4, state5; // Variables to store analog readings
int adc;            // Variable to store raw ADC value from the microphone
int dB = 0, PdB = 0; // Variables to store current and previous dB levels
String k;           // String to hold dB value
int mk;             // Length of dB string
int p = 0;          // Variable to indicate if dB value is present
int prevTime;       // Variable to store the previous time for interval checking
int curTime;        // Variable to store the current time for interval checking

void setup() {
  Serial.begin(38400); // Initialize serial communication at 38400 baud
  pinMode(13, OUTPUT); // Set pin 13 as an output for the Bluetooth module
  // pinMode(BUTTON_PIN, INPUT); // Uncomment if using button
  // myServo.attach(SERVO_PIN); // Uncomment if using servo
}

void loop() {
  if (flag == 0) {
    prevTime = millis(); // Store the current time
    flag = 1;           // Set flag to 1 to indicate timing start
  }

  // Read and calculate dB level from the microphone
  adc = analogRead(MIC_PIN);
  dB = (adc + 83.2073) / 11.003;

  // Check if dB value has changed significantly
  if (PdB - dB > 2 && dB <= 45 && dB >= 40) {
    k = String(dB);
    mk = k.length();
    p = (mk != 0) ? 1 : 0; // Update presence indicator
  }

  curTime = millis(); // Get the current time
  if (curTime - prevTime >= 1000) { // Check if 1 second has passed
    // Read analog values from all six sensors
    state0 = analogRead(A0);
    state1 = analogRead(A1);
    state2 = analogRead(A2);
    state3 = analogRead(A3);
    state4 = analogRead(A4);
    state5 = analogRead(A5);

    // Create a comma-separated string of sensor values and indicators
    String output = String(state0) + "," +
                    String(state1) + "," +
                    String(state2) + "," +
                    String(state3) + "," +
                    String(state4) + "," +
                    String(state5) + "," +
                    String(p) + "," + // Include presence indicator
                    String(0); // Placeholder for additional data

    Serial.println(output); // Send data to serial monitor

    // Reset variables
    flag = 0;
    p = 0;
    mk = 0;
    k = "";
    dB = 0;
    PdB = 0;
  }
}
