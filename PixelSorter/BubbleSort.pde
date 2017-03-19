int[] bubbleSort(int[] inputArray)
{
  for (int i = 0; i < inputArray.length; i++)
  {
    int lowest = inputArray[i];
    int lowestIndex = i;
    for (int j = i; j < inputArray.length; j++)
    {
      if (inputArray[j] < lowest)
      {
        lowestIndex = j;
        lowest = inputArray[j];
      }
    }
    int temp = inputArray[i];
    inputArray[i] = inputArray[lowestIndex];
    inputArray[lowestIndex] = temp;
  }

  return inputArray;
}