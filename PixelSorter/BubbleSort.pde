int percent = 0;

color[] bubbleSort(color[] inputArray, int mode)
{
  for (int i = 0; i < inputArray.length; i++)
  {
    if(i % (inputArray.length / 20) == 0)
    {
      percent += 5;
      println(percent + "%\n");
    }
    float best = getValueBu(inputArray[i], mode);
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

float getValueBu(color c, int val)
{
    switch(val)
  {
    case 0:
      return brightness(c);
    case 1:
      return saturation(c);
    case 2:
      return hue(c);
  }
  return -1.0f;
}