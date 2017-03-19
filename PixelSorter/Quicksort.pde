color[] quicksort(color[] inputArray) //<>//
{
  int pivot = inputArray.length - 1;
  int pointer = 0;
  int wall = 0;
  while (pointer < pivot)
  {
    if (hue(inputArray[pointer]) > hue(inputArray[pivot]))
    {
      swap(inputArray, pointer, wall);
      wall++;
      pointer++;
      continue;
    } else if (hue(inputArray[pointer]) <= hue(inputArray[pivot]))
    {
      pointer++;
      continue;
    }
  }
  int leftEnd = wall - 1;
  int rightStart = wall + 1;
  swap(inputArray, pivot, wall);

  int[] leftArray = new int[leftEnd + 1];
  arrayCopy(inputArray, 0, leftArray, 0, leftEnd + 1);

  int[] rightArray = new int[pivot - wall];
  arrayCopy(inputArray, rightStart, rightArray, 0, pivot - wall);

  if (leftArray.length > 1)
  {
    int [] sortedLeftArray = doQuicksort(leftArray);
    arrayCopy(sortedLeftArray, 0, inputArray, 0, sortedLeftArray.length);
  }

  if (rightArray.length > 1)
  {
    int [] sortedRightArray = doQuicksort(rightArray);        
    arrayCopy(sortedRightArray, 0, inputArray, rightStart, sortedRightArray.length);
  }

  return inputArray;
}

void swap(color[] _inputArray, color a, color b)
{
  color temp = _inputArray[a];
  _inputArray[a] = _inputArray[b];
  _inputArray[b] = temp;
}

int [] doQuicksort(int[] array)
{
  return quicksort(array);
}