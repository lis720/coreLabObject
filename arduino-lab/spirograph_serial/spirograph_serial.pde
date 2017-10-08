import processing.serial.*;

//values from 0 to 5
float ratio = 5;
//dont get too big or you'll crop!
int innerRadius = 8;
//negative for lobes outward, positive for lobes inward
//make into a float for more complex shapes
int lobes = -3;
int inputs = 3;
int[] valuesStored = {0, 0, 0};
int[] values = {0, 0, 0};

Serial myPort; // The serial port
String list;

void setup() {
  size(200, 200);
  stroke(0);
  noFill();
  background(255);
  frameRate(1000);
  
  myPort = new Serial(this, Serial.list()[6], 9600);
//print(Serial.list());
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
}

void draw() {
  
  //to center image
  translate(width/2, height/2);
  pushMatrix();
    rotate(radians(frameCount));
    translate(innerRadius * ratio, innerRadius * ratio);
    pushMatrix();
    translate(innerRadius/sqrt(2), innerRadius/sqrt(2));
    rotate(radians(frameCount)*lobes);
    //ellipse(innerRadius * ratio, innerRadius * ratio, 2, 2);
    point(innerRadius * ratio, innerRadius * ratio);
    popMatrix();
  popMatrix();

  if (abs(values[0] - valuesStored[0]) > 3 || abs(values[1] - valuesStored[1]) > 3 || abs(values[2] - valuesStored[2]) > 3){
    background(255);
  }
  if (values.length == valuesStored.length){
  arrayCopy(values, valuesStored);
  }

  innerRadius = int(map(values[0], 0, 1023, 1, 15));
  ratio = map(values[1], 0, 1023, 0, 5);
  lobes = int(map(values[2], 0, 1023, -10, 10));
  print("innerRadius: ");
  println(innerRadius);
  print("ratio: ");
  println(ratio);
  print("lobes: ");
  println(lobes);

}

void serialEvent (Serial myPort) {

// get the ASCII string:
String inString = myPort.readStringUntil('\n');

if (inString != null) {
// trim off any whitespace:
inString = trim(inString);
values = int(split(inString, '&'));
}

}