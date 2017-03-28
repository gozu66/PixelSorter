void setup() //<>//
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
    } else if (b_sortPixels != null && b_sortPixels.checkClicks() && display != null)
    {
      display.loadPixels();
      timer();
      display.pixels = quicksort(display.pixels);
      //PImage unsorted = display.get();      
      //display.pixels = sort(unsorted.pixels);
      timer();
      display.updatePixels();
    } else if (b_spiralPixels != null && b_spiralPixels.checkClicks() && display != null)
    {
      display.loadPixels();      
      timer();
      display.pixels = spiralOutFromCenter(display.pixels, display.pixelWidth, display.pixelHeight);
      timer();
      display.updatePixels();
    } else if (b_linearsort != null && b_linearsort.checkClicks() && display != null)
    {
      display.loadPixels();      
      timer();
      display.pixels = LinearConditionalSort(display.pixels, display.pixelWidth, display.pixelHeight);
      timer();
      display.updatePixels();
    } else if (b_saveOutput != null && b_saveOutput.checkClicks() && display != null)
    {
      selectInput("Save Image", "saveImages");
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
UIElement b_sortPixels = new UIElement(0, "Sort Pixels by brightness", new PVector(10, 80));
UIElement b_spiralPixels = new UIElement(0, "Spiral Pixels", new PVector(10, 150));
UIElement b_linearsort = new UIElement(0, "Sort Pixels Linearly", new PVector(10, 220));

UIElement b_saveOutput = new UIElement(0, "Save Image", new PVector(10, 490));

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
  b_saveOutput._draw();
  b_linearsort._draw();
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
    println("Time to compleate : " + t_stop);
  }
}