float t_start, t_stop;
void setup()
{
  int[] array = new int[1000000];
  for (int i = 0; i < array.length; i++)
  {
    array[i] = (int)random(0, 100);
    if (array.length <= 500)
    {
      print(array[i] + ", ");
    }
  }


  t_start = millis();
  array = bubbleSort(array);
  t_stop = millis() - t_start;
  if (array.length < 1001)
  {
    for (int i = 0; i < array.length; i++)
    {
      print(array[i]+", ");
    }
  }
  print("\nbubble sort :" + t_stop + "ms\n");

  t_start = millis();
  array = quicksort(array);
  t_stop = millis() - t_start;
  if (array.length < 1001)
  {
    println();
    for (int i = 0; i < array.length; i++)
    {
      print(array[i]+", ");
    }
  }
  print("\nquicksort :" + t_stop + "ms\n");
}