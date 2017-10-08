void setup() {
  // put your setup code here, to run once:
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
  
  Serial.println("potPin"); Serial.println(potPin);
  Serial.println("photo Pin");Serial.println(photoresistor);
  
  analogWrite(3,50);
  analogWrite(5,11);
  analogWrite(6,30);
}

//photoresistor 23-25
//R 11
//G 50
//B 30

//brigtness from a yellow stuff:522
//brightness from a teal stuff:235

