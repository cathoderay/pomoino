/*
  File: pomodoro.pde
  Author: Ronald Andreu Kaiser
  Creation date: 2010-01-16
  Description: pomodoro technique implementation for arduino.
  For more information about the technique, visit http://www.pomodorotechnique.com/
  Material: Arduino, 2 leds, and a buzzer (of course, a resistor for each component).
  How to use: set the time in minutes for your task/rest and
  upload to your arduino, changing the pin numbers properly.
*/


int buzzerPin = 10;
int redPin = 11;
int greenPin = 12;


void setup()   
{                
  pinMode(buzzerPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(redPin, OUTPUT);
}

void stopWarning()
{
  tone(buzzerPin, 220, 2000);
  delay(2000);
}


void startTaskTime(int minutes)
{
  digitalWrite(redPin, HIGH);
  int seconds = minutes * 60;
  int cycles = seconds / 2;
  for(int i = 1; i <= cycles; i++)
  {
    if(i % 5 == 0) //toggle lights on/off redPin in 10 seconds
      digitalRead(redPin) ? digitalWrite(redPin, LOW) : digitalWrite(redPin, HIGH);
    digitalWrite(buzzerPin, HIGH);
    delay(1000);
    digitalWrite(buzzerPin, LOW);
    delay(1000);
  }
  digitalWrite(redPin, LOW);  
}


void startRestTime(int minutes)
{
  digitalWrite(greenPin, HIGH);
  delay(minutes*60000);
  digitalWrite(greenPin, LOW);
}


void loop()
{ 
  startTaskTime(25); // set your task time in minutes
  stopWarning();
  startRestTime(5); // set your rest time in minutes
  stopWarning();
}
