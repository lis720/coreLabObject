import processing.serial.*;

Serial myPort; // The serial port
int potByte = 0;
String list;

void setup () {
  colorMode(HSB);
// set the window size:
size(400, 400);

myPort = new Serial(this, Serial.list()[1], 9600);
//print(Serial.list());

// don't generate a serialEvent() unless you get a newline character:
myPort.bufferUntil('\n');

background(0);
}
void draw () {
println(potByte);
background(map(potByte, 0, 1023, 0, 255),255,255);
}

void serialEvent (Serial myPort) {
// get the ASCII string:
String inString = myPort.readStringUntil('\n');

if (inString != null) {
// trim off any whitespace:
inString = trim(inString);
potByte = int(inString);
}
}