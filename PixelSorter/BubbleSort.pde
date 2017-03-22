int percent = 0;

color[] bubbleSort(color[] inputArray)
{
  for (int i = 0; i < inputArray.length; i++)
  {
    if(i % (inputArray.length / 20) == 0)
    {
      percent += 5;
      println(percent + "%\n");
    }
    float best = brightness(inputArray[i]);
    int bestIndex = i;
    for (int j = i; j < inputArray.length; j++)
    {
      if (inputArray[j] < best)
      {
        bestIndex = j;
        best = inputArray[j];
      }
    }
    int temp = inputArray[i];
    inputArray[i] = inputArray[bestIndex];
    inputArray[bestIndex] = temp;
  }

  return inputArray;
}