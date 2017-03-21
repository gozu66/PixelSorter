int[] bubbleSort(int[] inputArray)
{
  int percent = 0;
  for (int i = 0; i < inputArray.length; i++)
  {
    if(i % (inputArray.length / 100) == 0)
    {
      println(percent + "%");
      percent++;
    }
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