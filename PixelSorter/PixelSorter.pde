PImage img01;
PImage img02;
PImage outputImage;

void setup()
{
  img01 = loadImage("sim01.jpg");  
  img02= loadImage("sim02.jpg");  
  outputImage = createImage(img01.pixelWidth, img01.pixelHeight, RGB);
  surface.setSize(img01.pixelWidth * 2, img01.pixelHeight * 2);
}

boolean running, displaying;

void draw()
{
  if (!displaying)
  {
    displaying = true;
    displayImages(img01, outputImage, null);
  }

  if (keyPressed && !running)
  {
    running = true;
    outputImage = img01.copy();
    sortPixels(outputImage);
  }
}

void sortPixels(PImage input)
{
  input.loadPixels();

  int inputLen = input.pixels.length;
  int percentComp = 0;
  for (int i = 0; i < inputLen; i++)
  {
    if (i % (inputLen / 100) == 0)
    {
      percentComp++;
      print(percentComp + "%\n");
    }
    
    float selectedColor = 0.0f;
    int selectedPixel = i;
    for (int j = i; j < inputLen; j++)
    {
      float b = brightness(input.pixels[j]);
      if (b > selectedColor)
      {
        selectedPixel = j;
        selectedColor = b;
      }
    }
    color tempPixelContainer = input.pixels[i];
    input.pixels[i] = input.pixels[selectedPixel];
    input.pixels[selectedPixel] = tempPixelContainer;
  }
  input.updatePixels();
  
  displayImages(img01, outputImage, null);
  running = false;
}

void displayImages(PImage upLeft, PImage upRight, PImage downCenter)
{
  if(upLeft != null)image(upLeft, 0, 0);
  if(upRight != null)image(upRight, img01.pixelWidth, 0);
  if(downCenter != null)image(downCenter, img01.pixelWidth * 0.5f, img01.pixelHeight / 2);
}

void recreateImage()
{
}