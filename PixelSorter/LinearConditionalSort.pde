color[] xyFullSort(color[] inputArray, int _width, int _height)
{  
  if (linearSortMode == 0)
  {
    for (int col = 0; col < _width; col++)
    {
      color[] columnArray = sortColumn(col, _height, _width, inputArray);
      for (int c = 0; c < columnArray.length; c++)
      {
        inputArray[col + (c * _width)] = columnArray[c];
      }
    }
  } else if (linearSortMode == 1)
  {
    for (int row = 0; row < _height; row++)
    {
      color[] rowArray = sortRow(row, _width, inputArray);
      for (int r = 0; r < _width; r++)
      {
        inputArray[(row * _width) + r] = rowArray[r];
      }
    }
  }
  return inputArray;
}

color[] sortColumn(int col, int _height, int _width, color[] inputArray)
{
  color[] unsorted = new color[_height];
  for (int i = 0; i < _height; i++)
  {
    unsorted[i] = inputArray[col + (i * _width)];
  }
  color[] sorted = quicksort(unsorted, sortMode);
  return sorted;
}

color[] sortRow(int row, int _width, color[] inputArray)
{
  color[] unsorted = new color[_width];
  for (int i = 0; i < _width; i++)
  {
    unsorted[i] = inputArray[i + (row * _width)];
  }
  color[] sorted = quicksort(unsorted, sortMode);
  return sorted;
}