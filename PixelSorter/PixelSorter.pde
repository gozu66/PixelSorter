float t_start, t_stop;
void setup()
{
  int[] array = new int[100000];
  for (int i = 0; i < array.length; i++)
  {
    array[i] = (int)random(0, 1000);
  }

  t_start = millis();
  array = quicksort(array);
  t_stop = millis() - t_start;
  if (array.length < 1001)
  {
    for (int i = 0; i < array.length; i++)
    {
      print(array[i]+",");
    }
  }
  print("\n quicksort :" + t_stop + "ms\n");

  t_start = millis();
  array = bubbleSort(array);
  t_stop = millis() - t_start;
  if (array.length < 1001)
  {
    for (int i = 0; i < array.length; i++)
    {
      print(array[i]+",");
    }
  }
  print("\n bubble sort :" + t_stop + "ms\n");
}



//PImage img01;
//PImage img02;
//PImage outputImage;

//float timer;

//void setup()
//{  
//  img01 = loadImage("IMAG0374.jpg");  
//  img02 = loadImage("sim02.jpg");  
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

//    timer = millis();
//    //recreateImage(img01, img02);
//    sortPixels(outputImage);
//    timer = millis() - timer;

//    timer = timer / 1000;
//    print("Sort time : " + timer + "s");
//    saveImages();
//  }
//}

//void sortPixels(PImage input)
//{
//  input.loadPixels();

//  int inputLen = input.pixels.length;
//  int percentComp = 0;
//  for (int i = 0; i < inputLen; i++)
//  {
//    if (i % (inputLen / 100) == 0)
//    {
//      percentComp++;
//      print(percentComp + "%\n");
//    }

//    float selectedColor = 0.0f;
//    int selectedPixel = i;
//    for (int j = i; j < inputLen; j++)
//    {
//      float b = brightness(input.pixels[j]);
//      if (b > selectedColor)
//      {
//        selectedPixel = j;
//        selectedColor = b;
//      }
//    }
//    color tempPixelContainer = input.pixels[i];
//    input.pixels[i] = input.pixels[selectedPixel];
//    input.pixels[selectedPixel] = tempPixelContainer;
//  }
//  input.updatePixels();

//  displayImages(img01, null, outputImage);
//  running = false;
//}


//void recreateImage(PImage imageToCopy, PImage imageToEdit)
//{
//  int len = imageToCopy.pixels.length;
//  imageToCopy.loadPixels();
//  imageToEdit.loadPixels();
//  outputImage.loadPixels();
//  int percentComp = 0; 
//  for (int i = 0; i < len; i++)
//  {
//    if (i % (len / 100) == 0)
//    {
//      percentComp++;
//      print(percentComp + "% \n");
//    }

//    float selectedColorDif = 1000f;
//    int selectedPixel = i;
//    float col01 = brightness(imageToCopy.pixels[i]);
//    for (int j = 0; j < len; j++)
//    {      
//      float col02 = brightness(imageToEdit.pixels[j]);
//      float dif = abs(col01-col02);
//      if (dif < selectedColorDif)
//      {
//        selectedColorDif = dif;
//        selectedPixel = j;
//      }
//    }
//    //color temp = imageToEdit.pixels[i];
//    //print(selectedColorDif + " \n");
//    outputImage.pixels[i] = imageToEdit.pixels[selectedPixel];
//  }
//  imageToCopy.updatePixels();
//  imageToEdit.updatePixels();
//  outputImage.updatePixels();
//  displayImages(imageToCopy, img02, outputImage);
//  saveImages();
//}

//void displayImages(PImage upLeft, PImage upRight, PImage downCenter)
//{
//  if (upLeft != null)image(upLeft, 0, 0);
//  if (upRight != null)image(upRight, img01.pixelWidth * 2, 0);
//  if (downCenter != null)image(downCenter, img01.pixelWidth, 0);
//}

//void saveImages()
//{
//  save("full" + minute() + hour() + "_" + day() + "." + month() + "." + year());
//  outputImage.save("output" + minute() + hour() + "_" + day() + "." + month() + "." + year());
//}