void setup() {
  // put your setup code here, to run once:
  //declare my pins
  //3=green 6=blue 5=red
  Serial.begin(9600);
  //pinMode(3,OUTPUT);
  //pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(A0,INPUT);//POTENTIOMETER
  pinMode(A1,INPUT);//PHOTORESISTER
}

void loop() {
  // put your main code here, to run repeatedly:
  int potPin=analogRead(A0);
  int photoresistor=analogRead(A1);
  potPin = map(potPin,0,1023,0,255);
  photoresistor = map(photoresistor,0,1023,0,255);
  Serial.println("potPin");
  Serial.println(potPin);
  Serial.println("photo Pin");
  Serial.println(photoresistor);  
  //analogWrite(3,potPin);
  //analogWrite(5,potPin);
  analogWrite(6,potPin);
  delay(1000) ;
  
}
