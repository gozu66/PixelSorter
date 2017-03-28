int j = 0;
color[] spiralOutFromCenter(color[] inputArray, int _width, int _height)
{
  PImage scratch = new PImage(_width, _height); //<>//
  int pixelAmt = inputArray.length;
  //int pixelCount = 0;
  //int Ox = _width / 2;
  //int Oy = _height / 2;
  int Ox = 0;
  int Oy = 0;

  int i = 0;
  j = 0;
  //writePixel(Ox, Oy, pixelCount, pixelAmt, _width, scratch, inputArray);  

  while (true) //<>//
  {
    //for (int a = 0; a < 1 + i; a++) {
    //  writePixel(Ox, Oy - 1, pixelCount, pixelAmt, _width, scratch, inputArray);  
    //  Oy = Oy - 1;
    //}
    //for (int b = 0; b < 1 + i; b++) {
    //  writePixel(Ox - 1, Oy, pixelCount, pixelAmt, _width, scratch, inputArray);  
    //  Ox = Ox - 1;
    //}
    //for (int c = 0; c < 2 + i; c++) {
    //  writePixel(Ox, Oy + 1, pixelCount, pixelAmt, _width, scratch, inputArray);  
    //  Oy = Oy + 1;
    //}
    //for (int d = 0; d < 2 + i; d++) {
    //  writePixel(Ox + 1, Oy, pixelCount, pixelAmt, _width, scratch, inputArray);  
    //  Ox = Ox + 1;
    //}
    for (int a = 0; a <= (_width - 2) - i; a++) {
      writePixel(Ox, Oy, pixelAmt, _width, scratch, inputArray);  
      Ox += 1;
    }

    for (int b = 0; b <= (_height - 2) - i; b++) {
      writePixel(Ox, Oy, pixelAmt, _width, scratch, inputArray);  
      Oy += 1;
    }
    
    for (int c = 0; c <= (_width - 2) - i; c++) {
      writePixel(Ox, Oy, pixelAmt, _width, scratch, inputArray);  
      Ox -= 1;
    }
    for (int d = 0; d <= (_height - 2) - i; d++) {
      writePixel(Ox, Oy, pixelAmt, _width, scratch, inputArray);  
      if(d < (_height - 2) - i)
        Oy -= 1;
    }
    Ox += 1;
    if (j >= pixelAmt)
    {
      updateUI(scratch);
      return scratch.pixels;
    } else {
      i += 2;
    }
  }
}

void writePixel(int ox, int oy, int pixelAmt, int _width, PImage scratch, color[] inputArray)
{
  if (j < pixelAmt)
  {
    int cellRef = ox + (oy * _width);
    if (cellRef < pixelAmt && cellRef >= 0 && j < pixelAmt)
    {
      scratch.pixels[cellRef] = inputArray[j];
      j++;
    }
  }
}