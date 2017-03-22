void setup()
{
  size(1000, 600);
  background(36, 71, 42);
  UpdateUI();
}

void draw()
{
  if (mousePressed)
  {
    if (b_loadImage != null)
      println(b_loadImage.checkClicks());
  }
}

UIElement b_loadImage = new UIElement(0, "Choose a .jpg .gif or .png", new PVector(10, 10));
void UpdateUI()
{
  fill(100);
  rect(width / 5, 0, width, height);


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

//PImage img01;
////PImage img02;
//PImage outputImage;

//void setup()
//{  
//  img01 = loadImage("20161203201544_1.jpg");  
//  //img02 = loadImage("sim02.jpg");  
//  outputImage = createImage(img01.pixelWidth, img01.pixelHeight, RGB);
//  surface.setSize(img01.pixelWidth * 2, img01.pixelHeight);
//}

//boolean running, displaying;

//void draw()
//{
//  if (!displaying)
//  {
//    displaying = true;
//    displayImages(img01, null, null);
//  }

//  if (keyPressed && !running)
//  {
//    running = true;
//    outputImage = img01.copy();

//    outputImage.loadPixels();

//    timer();
//    outputImage.pixels = bubbleSort(img01.pixels);
//    timer();   
//    print("w/ Bubble");
//    outputImage.updatePixels();

//    displayImages(img01, null, outputImage);
//    //saveImages();

//    println();

//    outputImage.loadPixels();

//    timer();   
//    outputImage.pixels = quicksort(img01.pixels);
//    timer();   
//    print("w/ Quicksort");

//    outputImage.updatePixels();

//    displayImages(img01, null, outputImage);
//    saveImages();
//  }
//}


//void displayImages(PImage upLeft, PImage upRight, PImage downCenter)
//{
//  if (upLeft != null)image(upLeft, 0, 0);
//  if (upRight != null)image(upRight, img01.pixelWidth * 2, 0);
//  if (downCenter != null)image(downCenter, img01.pixelWidth, 0);
//}