void setup()
{
  size(1000, 600);
  background(100);
  noStroke();
  UpdateUI();
}

boolean canTakeInput = true;
void draw()
{  
  if (display != null)
  {
    imageMode(CENTER);
    image(display, width * 0.6f, height * 0.5f);
        //image(display, 100, 100);

  }

}

void mousePressed()
{
  if (canTakeInput && b_loadImage != null)
  {
    if (b_loadImage.checkClicks())
    {
      selectInput("Select a file", "fileSelected");
    }
  }

  canTakeInput = false;
}

void mouseReleased()
{
  canTakeInput = true;
}


PImage display;
UIElement b_loadImage = new UIElement(0, "Choose a .jpg .gif or .png", new PVector(10, 10));
void UpdateUI()
{
  fill(225);
  rect(width / 5, 0, width, height);
  if (display != null)
  {
    //image(display, width * 0.6f, height * 0.3f); //<>//
        image(display, 100, 100);

  }

  b_loadImage._draw();
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
    print("Time to compleate : " + t_stop);
  }
}