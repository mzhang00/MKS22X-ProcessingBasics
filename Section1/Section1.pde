int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  float heightt, widthh;
  Visualizer(float x, float y, int len, float heightt, float widthh) {
    this.x = x;
    this.y = y;
    this.heightt = heightt;
    this.widthh = widthh;
    values = new float[len];
    speeds = new float[len];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-1 * ((heightt/2) - 1), ((heightt/2) - 1));
      speeds[i] = random(heightt / 100);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, widthh, heightt);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+(heightt/2), x+widthh, y+(heightt/2));

    float rectWidth = widthh / values.length;

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD!!!
    //THESE ARE WRONG: They just illustrate how they could look

    for (int i = 0; i < values.length; i++) {
      if (values[i] < (-1 * (heightt / 4))) {
        fill(255, 0, 0);
      } else if (values[i] < 0) {
        fill(255, 165, 0);
      } else if (values[i] < (heightt / 4)) {
        fill(255, 255, 0);
      } else {
        fill(0, 255, 0);
      }
      rect(x + (rectWidth * i), y+ (heightt / 2), rectWidth, -1 * values[i]);
    }

    //Width of the visualizer is 400!
  }
  void update() {
    //???WRITE THIS METHOD!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i];
      if (values[i] >= ((heightt/2) - 1) || values[i] <= -1 * ((heightt/2) - 1)) {
        speeds[i] *= -1;
      }

      //??? keep them values between max/min value

      //??? reverse the speeds so they oscillate up/down when they reach max/min
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 40, 400, 500);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
