void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(A1,INPUT);

  pinMode(3,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);


}

void loop() {
  // put your main code here, to run repeatedly:
  int photoresistor=analogRead(A1);

  Serial.println("photoPin");
  Serial.println(photoresistor);

  analogWrite(3,50);
  analogWrite(5,11);
  analogWrite(6,30);

}

//green=235
//yellow=522
