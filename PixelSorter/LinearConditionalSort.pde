color startColor = color(255, 0, 0);
int blackValue = -14500000;
int brightnessValue = 60;
int whiteValue = -13000000;


color[] conditionalLinearSort(color[] inputArray, int _width, int _height)
{  
  if (linearConditionalSortMode == 0)
  {
    for (int col = 0; col < _width; col++)
    {
      //int i = dist();
      color[] columnArray = sortColumnConditional(col, _height, _width, inputArray);
      for (int c = 0; c < columnArray.length; c++)
      {
        inputArray[col + (c * _width)] = columnArray[c];
      }
    }
  } else if (linearConditionalSortMode == 1)
  {
    for (int row = 0; row < _height; row++)
    {
      color[] rowArray = sortRowConditional(row, _width, inputArray);
      for (int r = 0; r < _width; r++)
      {
        inputArray[(row * _width) + r] = rowArray[r];
      }
    }
  }
  return inputArray;
}

color[] sortColumnConditional(int col, int _height, int _width, color[] inputArray)
{
  color[] unsorted = new color[_height];
  color[] sorted = new color[_height];
  for (int i = 0; i < _height; i++)
  {
    unsorted[i] = inputArray[col + (i * _width)];
  }
  if (unsorted[0] < blackValue)
  {
    sorted = quicksort(unsorted, sortMode);
  }
  return sorted;
}

color[] sortRowConditional(int row, int _width, color[] inputArray)
{
  color[] unsorted = new color[_width];
  for (int i = 0; i < _width; i++)
  {
    unsorted[i] = inputArray[i + (row * _width)];
  }
  color[] sorted = quicksort(unsorted, sortMode);
  return sorted;
}