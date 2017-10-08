void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

void loop() {
  Serial.print(analogRead(A0));
  Serial.print('&');
  Serial.print(analogRead(A1));
  Serial.print('&');
  Serial.println(analogRead(A2));
}
