int percent = 0;

color[] bubbleSort(color[] inputArray)
{
  for (int i = 0; i < inputArray.length; i++)
  {
    if(i % (inputArray.length / 100) == 0)
    {
      percent++;
      println(percent + "%\n");
    }
    float best = hue(inputArray[i]);
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