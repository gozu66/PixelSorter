PImage img01;
PImage img02;
PImage outputImage;

void setup()
{
  img01 = loadImage("sim01_sm.jpg");  
  img02 = loadImage("sim02_sm.jpg");  
  outputImage = createImage(img01.pixelWidth, img01.pixelHeight, RGB);
  surface.setSize(img01.pixelWidth * 3, img01.pixelHeight);
}

boolean running, displaying;

void draw()
{
  if (!displaying)
  {
    displaying = true;
    displayImages(img01, img02, null);
  }

  if (keyPressed && !running)
  {
    running = true;
    //outputImage = img01.copy();
    //sortPixels(outputImage);
    recreateImage(img01, img02);
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
      float b = saturation(input.pixels[j]);
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


void recreateImage(PImage imageToCopy, PImage imageToEdit)
{
  int len = imageToCopy.pixels.length;
  imageToCopy.loadPixels();
  imageToEdit.loadPixels();
  outputImage.loadPixels();
  int percentComp = 0; 
  for (int i = 0; i < len; i++)
  {
    if (i % (len / 100) == 0)
    {
      percentComp++;
      print(percentComp + "% \n");
    }

    float selectedColorDif = 1000f;
    int selectedPixel = i;
    float col01 = brightness(imageToCopy.pixels[i]);
    for (int j = 0; j < len; j++)
    {      
      float col02 = brightness(imageToEdit.pixels[j]);
      float dif = abs(col01-col02);
      if (dif < selectedColorDif)
      {
        selectedColorDif = dif;
        selectedPixel = j;
      }
    }
    //color temp = imageToEdit.pixels[i];
    //print(selectedColorDif + " \n");
    outputImage.pixels[i] = imageToEdit.pixels[selectedPixel];
  }
  imageToCopy.updatePixels();
  imageToEdit.updatePixels();
  outputImage.updatePixels();
  displayImages(imageToCopy, img02, outputImage);
  save("full04");
  outputImage.save("output04");
}

void displayImages(PImage upLeft, PImage upRight, PImage downCenter)
{
  if (upLeft != null)image(upLeft, 0, 0);
  if (upRight != null)image(upRight, img01.pixelWidth * 2, 0);
  if (downCenter != null)image(downCenter, img01.pixelWidth, 0);
}