int Ox, Oy, ox, oy;
int pixelAmt, pixelCount = 0;
PImage scratch;

color[] spiralOutFromCenter(color[] inputArray, int _width, int _height)
{
  scratch = new PImage(_width, _height);
  pixelAmt = inputArray.length;
  Ox = _width / 2;
  Oy = _height / 2;
  int percent = 0;
  int ONEpercent = (pixelAmt * 2) / 100;

  //for (i = 0; i < pixelAmt * 2; i+=2)
  while(true)
  {
    //if (i % ONEpercent == 0)
    //{
    //  percent++;
    //  println(percent + "%");
    //}

    for (int a = 0; a < 1 + i; a++) {
      //pixelCount += writePixel(inputArray, Ox, Oy - 1, _width, scratch.pixels);
      ox = Ox;
      oy = Oy - 1;
      if (pixelCount + 1 < pixelAmt)
      {

        int cellRef = ox + (oy * _width);
        if (cellRef >=10000)
          err++;

        if (cellRef < pixelAmt && cellRef >= 0 && j < pixelAmt)
        {
          scratch.pixels[cellRef] = inputArray[j];
          j++;
        }
      }
      Ox = ox;
      Oy = oy;
    }
    for (int b = 0; b < 1 + i; b++) {
      //pixelCount += writePixel(inputArray, Ox - 1, Oy, _width, scratch.pixels);
      ox = Ox - 1;
      oy = Oy;
      if (pixelCount + 1 < pixelAmt)
      {
        int cellRef = ox + (oy * _width);
        if (cellRef >=10000)
          err++;


        if (cellRef < pixelAmt && cellRef >= 0 && j < pixelAmt)
        {
          scratch.pixels[cellRef] = inputArray[j];
          j++;
        }
      }
      Ox = ox;
      Oy = oy;
    }
    for (int c = 0; c < 2 + i; c++) {
      //pixelCount += writePixel(inputArray, Ox, Oy + 1, _width, scratch.pixels);
      ox = Ox;
      oy = Oy + 1;
      if (pixelCount + 1 < pixelAmt)
      {
        int cellRef = ox + (oy * _width);   
        if (cellRef >=10000)
          err++;

        if (cellRef < pixelAmt && cellRef >= 0 && j < pixelAmt)
        {
          scratch.pixels[cellRef] = inputArray[j];
          j++;
        }
      }
      Ox = ox;
      Oy = oy;
    }
    for (int d = 0; d < 2 + i; d++) {
      //pixelCount += writePixel(inputArray, Ox + 1, Oy, _width, scratch.pixels);
      ox = Ox + 1;
      oy = Oy;
      if (pixelCount + 1 < pixelAmt)
      {
        int cellRef = ox + (oy * _width);
        if (cellRef >=10000)
          err++;

        if (cellRef < pixelAmt && cellRef >= 0 && j < pixelAmt)
        {
          scratch.pixels[cellRef] = inputArray[j];
          j++;
        }
      }
      Ox = ox;
      Oy = oy;
    }
    if (j >= pixelAmt)
    {
      updateUI(scratch);
      return scratch.pixels;
    }
    else{
      i += 2;
    }
  }
}
int err = 0;
int j = 0;
int i = 0;
//int writePixel(color[] read, int ox, int oy, int _width, color[] write)
//{
//}