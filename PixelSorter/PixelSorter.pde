int pixelLength = 10000; //<>//

int p = 0, i = 1;
int Ox = width / 2;
int Oy = height / 2;

void setup()
{
  size(500, 500);
  frameRate(24);


  rect(Ox, Oy, 100, 100);
  p++;

  //boolean x = true;
  //while (x)
  //{
  //  println("ggg");
  //}
}
void draw()
{
  for (int a = 10; a < i + 20; a+=10)
  {
    if (p >= pixelLength) {
      //x = false; 
      break;
    }

    rect(Ox, Oy - a, 1, 1);
    p++;
  }
  for (int b = 10; b < i + 20; b+=10)
  {
    if (p >= pixelLength) {
      //x = false; 
      break;
    }

    rect(Ox - b, Oy - i, 1, 1);
    p++;
  }
  for (int c = 10; c < i + 30; c+=30)
  {
    if (p >= pixelLength) {
      //x = false; 
      break;
    }

    rect(Ox - i, Oy + c, 1, 1);
    p++;
  }
  for (int d = 10; d < i + 30; d+=30)
  {
    if (p >= pixelLength) {
      //x = false; 
      break;
    }

    rect(Ox - d, Oy + i, 1, 1);
    p++;
  }
  i++;
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