color[] LinearConditionalSort(color[] inputArray, int _width, int _height)
{  
  for (int col = 0; col < _width - 1; col++)
  {
    color[] column = sortColumn(col, _height, _width, inputArray);
    for(int c = 0; c < column.length; c++)
    {
      inputArray[col + (c * _width)] = column[c];
    }
  }
  //for (int row = 0; row < _height - 1; row++)
  //{
  //  color[] _row = sortRow(row, _height, _width, inputArray);
  //  for(int r = 0; r < _row.length; r++)
  //  {
  //    inputArray[r + (row * _height)] = _row[r];
  //  }
  //}
  return inputArray;
}

color[] sortColumn(int col, int _height, int _width, color[] inputArray)
{
  color[] unsorted = new color[_height];
  for(int i = 0; i < _height - 1; i++)
  {
    unsorted[i] = inputArray[col + (i * _width)];
  }
  color[] sorted = quicksort(unsorted);
  return sorted;
}

color[] sortRow(int row, int _height, int _width, color[] inputArray)
{
  color[] unsorted = new color[_width];
  for(int i = 0; i < _width - 1; i++)
  {
    unsorted[i] = inputArray[i + (row * _width)];
  }
  color[] sorted = quicksort(unsorted);
  return sorted;
}