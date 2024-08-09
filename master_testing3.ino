/**
 * @file SerialInputProcessing.ino
 * @brief Reads data from the serial port and processes it with timing conditions.
 */

/**
 * @var String readString
 * @brief Stores the incoming data read from the serial port.
 */
String readString;

/**
 * @var int curTime
 * @brief Current time in milliseconds.
 */
int curTime;

/**
 * @var int prevTime
 * @brief Previous time in milliseconds.
 */
int prevTime;

/**
 * @var int flag
 * @brief Flag used to control timing conditions. Initialized to 0.
 */
int flag = 0;

/**
 * @function setup
 * @brief Initializes serial communication and sets up initial timing conditions.
 */
void setup() {
  Serial.begin(38400); ///< Initialize serial communication at 38400 baud rate.
  
  if (flag == 0) {
    prevTime = millis(); ///< Record the current time.
    flag = 1; ///< Set flag to indicate initial time has been recorded.
  }

  curTime = millis(); ///< Update current time.
  
  if (curTime - prevTime >= 1000) {
    flag = 0; ///< Reset flag if 1000 milliseconds have passed.
  }
  // Serial.println("serial-delimit-21"); // Uncomment for debugging.
}

/**
 * @function loop
 * @brief Continuously reads from the serial port and processes incoming data.
 */
void loop() {
  // Expecting strings like "wer,qwe rty,123 456,hyre kjhg," or "hello world,who are you?,bye!,"
  while (Serial.available() > 0) {
    if (flag == 0) {
      prevTime = millis(); ///< Update previous time.
      flag = 1; ///< Set flag to manage timing.
    }

    curTime = millis(); ///< Update current time.
    
    if (curTime - prevTime >= 10) {
      flag = 0; ///< Reset flag after 10 milliseconds.
    }

    char c = Serial.read(); ///< Read a character from the serial buffer.
    
    if (c == ' ') {
      break; ///< Exit the loop when a space character is encountered.
    }
    
    readString += c; ///< Append the character to readString.
  }   

  if (readString.length() > 0) {
    Serial.print(readString); ///< Print the readString to the serial port.
    // Add other processing for the string here.
  }
  
  readString = ""; ///< Clear readString for new input.
}
