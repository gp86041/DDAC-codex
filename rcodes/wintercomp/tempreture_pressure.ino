/*
SparkFun Inventor's Kit Galileo
Example sketch 07

TEMPERATURE SENSOR

  Use the "serial monitor" window to read a temperature sensor.

  The TMP36 is an easy-to-use temperature sensor that outputs
  a voltage that's proportional to the ambient temperature.
  You can use it for all kinds of automation tasks where you'd
  like to know or control the temperature of something.

  More information on the sensor is available in the datasheet:
  http://dlnmh9ip6v2uc.cloudfront.net/datasheets/Sensors/Temp/TMP35_36_37.pdf

  Even more exciting, we'll start using the Arduino's serial port
  to send data back to your main computer! Up until now, we've 
  been limited to using simple LEDs for output. We'll see that
  the Arduino can also easily output all kinds of text and data.

Hardware connections:

  Be careful when installing the temperature sensor, as it is
  almost identical to the transistors! The one you want has 
  a triangle logo and "TMP" in very tiny letters. The
  ones you DON'T want will have "222" on them.

  When looking at the flat side of the temperature sensor
  with the pins down, from left to right the pins are:
  5V, SIGNAL, and GND.

  Connect the 5V pin to 5 Volts (5V).
  Connect the SIGNAL pin to ANALOG pin 0.
  Connect the GND pin to ground (GND).

This sketch was written by SparkFun Electronics,
with lots of help from the Arduino community.
This code is completely free for any use.
Visit http://learn.sparkfun.com/products/2 for SIK information.
Visit http://www.arduino.cc to learn about the Arduino.

Version 2.0 6/2012 MDG
*/

// We'll use analog input 0 to measure the temperature sensor's
// signal pin.

const int temperaturePin = 0;
const int pressure = 1;


void setup()
{


  Serial.begin(9600);
}


void loop()
{
  
  
  
  float force, voltage, degreesC, degreesF;
  
  force = analogRead(pressure);

  voltage = getVoltage(temperaturePin);

  degreesC = (voltage - 0.5) * 100.0;

  degreesF = degreesC * (9.0/5.0) + 32.0;
  
  //Serial.print("voltage: ");
  //Serial.print(voltage);
  //Serial.print("  deg C: ");
  Serial.print(degreesC);
  Serial.print(",");
  //Serial.print("  deg F: ");
  //Serial.println(degreesF);
  Serial.println(force);

  delay(1000); 
}


float getVoltage(int pin)
{
 

  return (analogRead(pin) * 0.004882814);

 
}

