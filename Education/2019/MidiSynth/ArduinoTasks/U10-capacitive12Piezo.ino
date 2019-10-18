#include <CapacitiveSensor.h>

/*
 * CapitiveSense Library Demo Sketch
 * Paul Badger 2008
 * Uses a high value resistor e.g. 10M between send pin and receive pin
 * Resistor effects sensitivity, experiment with values, 50K - 50M. Larger resistor values yield larger sensor values.
 * Receive pin is the sensor pin - try different amounts of foil/metal on this pin
 */


CapacitiveSensor   cs[12] = {
CapacitiveSensor(2,3), CapacitiveSensor(2,A5), CapacitiveSensor(2,5),
CapacitiveSensor(2,7), CapacitiveSensor(2,8), CapacitiveSensor(2,A3),
CapacitiveSensor(2,10), CapacitiveSensor(2,11), CapacitiveSensor(2,12),
CapacitiveSensor(2,A0),CapacitiveSensor(2,A1), CapacitiveSensor(2,A2)};

int was[12] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int freq[12] = {524, 554, 587, 622, 659, 698, 739, 783, 830, 880, 932, 987};
//int base[12] = {23, 14, 10, 26, 173, 170, 73, 116, 10, 7, 6};
//int base[12] = {4, 5, 3, 6, 19, 3, 10, 20, 3, 5, 4, 18};
//int base[12] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int base[12] = {187, 165, 154, 126, 187, 187, 97, 145, 102, 144, 93, 167};

void setup()                    
{
  for (int i=0; i<12; i++)
    cs[i].set_CS_AutocaL_Millis(0xFFFFFFFF);
    
  Serial.begin(9600);
}

void loop()                    
{
    long start = millis();
    long total[12];
    for (int i=0; i<12; i++)
      total[i] = cs[i].capacitiveSensorRaw(5) - base[i];

    Serial.print(millis() - start);        // check on performance in milliseconds
    Serial.print("\t");                    // tab character for debug windown spacing

    

    int threshold = 20;
    int is[12];
    for (int i=0; i<12; i++)
      is[i] = total[i] > threshold;

    for (int i=0; i<12; i++)
    {
      Serial.print(total[i]);                  // print sensor output 1
      Serial.print("\t");
    }
    for (int i=0; i<12; i++)
    {
      Serial.print(is[i]);    
    }
    Serial.print("\n");


    for (int i=0; i<12; i++)
    {
      if (is[i]==1 && was[i]==0)
      {
        tone(4, freq[i]);
        was[i] = 1;
      }
  
      if (is[i]==0 && was[i]==1)
      {
        noTone(4);
        was[i] = 0;
      }
    }
    
    delay(10);                             // arbitrary delay to limit data to serial port 
}
