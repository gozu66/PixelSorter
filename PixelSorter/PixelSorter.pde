int pixelLength = 10000; //<>// //<>// //<>//

int p = 0, i = 1;
int Ox;
int Oy;
void setup()
{
  size(500, 500);
  background(0);
  noStroke();
  frameRate(1);

  Ox = width / 2;
  Oy = height / 2;

  rect(Ox, Oy, 5, 5);
  call();
}
int pixelAmt = 1012, pixelCount = 0;
void call()
{
  for (int i = 0; i < pixelAmt; i+=2)
  {
    for (int a = 0; a < 1 + i; a++)
    {
      //rect(Ox, Oy - 10, 5, 5);
      pixelCount += drawRect(Ox, Oy - 10, 5, 5);
    }
    for (int b = 0; b < 1 + i; b++)
    {
      //rect(Ox, Oy - 10, 5, 5);
      pixelCount += drawRect(Ox - 10, Oy, 5, 5);
    }
    for (int c = 0; c < 2 + i; c++)
    {
      //rect(Ox, Oy - 10, 5, 5);
      pixelCount += drawRect(Ox, Oy + 10, 5, 5);
    }
    for (int d = 0; d < 2 + i; d++)
    {
      //rect(Ox, Oy - 10, 5, 5);
      pixelCount += drawRect(Ox + 10, Oy, 5, 5);
    }
  }
}
//int r, g, b;
int drawRect(int a, int b, int c, int d)
{
  //r += 1; g +=1; b += 1;
  //fill(r,g,b);
  fill(a, b, d);
  if (pixelCount + 1 < pixelAmt)
  {
    rect(a, b, c, d);
  }
  Ox = a;
  Oy = b;
  return 1;
}

//void setup()
//{
//  size(1000, 600);
//  background(100);
//  noStroke();
//  UpdateUI();
//}

//boolean canTakeInput = true;
//void draw()
//{  
//  if (display != null)
//  {
//    imageMode(CENTER);
//    image(display, width * 0.6f, height * 0.5f);
//        //image(display, 100, 100);

//  }

//}

//void mousePressed()
//{
//  if (canTakeInput && b_loadImage != null)
//  {
//    if (b_loadImage.checkClicks())
//    {
//      selectInput("Select a file", "fileSelected");
//    }
//  }

//  canTakeInput = false;
//}

//void mouseReleased()
//{
//  canTakeInput = true;
//}


//PImage display;
//UIElement b_loadImage = new UIElement(0, "Choose a .jpg .gif or .png", new PVector(10, 10));
//void UpdateUI()
//{
//  fill(225);
//  rect(width / 5, 0, width, height);
//  if (display != null)
//  {
//    //image(display, width * 0.6f, height * 0.3f);
//        image(display, 100, 100);

//  }

//  b_loadImage._draw();
//}

//float t_start, t_stop;
//boolean timerRunning = false;
//void timer()
//{
//  if (!timerRunning)
//  {
//    timerRunning = true;
//    t_start = millis();
//  } else
//  {
//    timerRunning = false;
//    t_stop = millis() - t_start;
//    print("Time to compleate : " + t_stop);
//  }
//}