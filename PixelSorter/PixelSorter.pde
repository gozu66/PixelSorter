void setup()
{
  size(1000, 600);
  background(100);
  noStroke();
  updateUI(null);
}

boolean canTakeInput = true;
void draw()
{  
  if (display != null)
  {
    imageMode(CENTER);
    image(display, width * 0.6f, height * 0.5f);
  }
}

void mousePressed()
{
  if (canTakeInput)
  {
    if (b_loadImage != null && b_loadImage.checkClicks())
    {
      selectInput("Select a file", "fileSelected");
    }
    else if (b_sortPixels != null && b_sortPixels.checkClicks() && display != null)
    {
      //PImage display = display.get();
      display.loadPixels();
      display.pixels = quicksort(display.pixels);
      display.updatePixels();
      //updateUI(display);
    }
    else if (b_spiralPixels != null && b_spiralPixels.checkClicks() && display != null)
    {
      //PImage display = display.get();
      display.loadPixels();      
      display.pixels = spiralOutFromCenter(display.pixels, display.pixelWidth, display.pixelHeight);
      display.updatePixels(); //<>//
      //updateUI(display);
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
UIElement b_sortPixels = new UIElement(0, "Sort Pixels", new PVector(10, 80));
UIElement b_spiralPixels = new UIElement(0, "Spiral Pixels", new PVector(10, 150));

void updateUI(PImage img)
{
  fill(225);
  rect(width / 5, 0, width, height);
  if (img != null)
  {
    display = img;
  }
  b_loadImage._draw();
  b_sortPixels._draw();
  b_spiralPixels._draw();
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