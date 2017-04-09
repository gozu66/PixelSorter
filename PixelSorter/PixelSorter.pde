int globalW, globalH; //<>// //<>//
boolean canTakeInput = true;
int sortMode = 0;      // 0 = brightness  // 1 = saturation  // 2 = hue
int linearSortMode = 0; // 0 = Vertical  // 1 = Horizontal

void setup()
{
  size(1000, 600);
  background(100);
  noStroke();
  textSize(10);
  updateUI(null, 0, 0);
}

void draw()
{  
  rect(width / 5, 0, width, height);
  if (display != null)
  {
    imageMode(CENTER);
    image(display, width * 0.6f, height * 0.5f, globalW, globalH);
  }
}

void mousePressed()
{
  if (canTakeInput)
  {
    mouseWasPressed();
  }
}

void mouseReleased()
{
  canTakeInput = true;
}


PImage display;
void updateUI(PImage img, int w, int h)
{
  fill(225);
  if (img != null)
  {
    display = img;
    globalW = w;
    globalH = h;
  }
  drawUI();
}


float t_start, t_stop;
boolean timerRunning = false;
void timer()
{
  if (!timerRunning)
  {
    timerRunning = true;
    t_start = millis();
  } else
  {
    timerRunning = false;
    t_stop = millis() - t_start;
    println("Time to complete : " + t_stop);
  }
}