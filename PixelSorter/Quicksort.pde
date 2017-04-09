import java.util.ArrayDeque;

ArrayDeque<Integer> stack = new ArrayDeque<Integer>();

color[] quicksort(color[] inputArray, int mode)
{
  stack.push(0);
  stack.push(inputArray.length - 1);

  int pointer, wall, pivot;
  
  while (stack.size() > 0)
  {
    int rIndex = stack.pop();
    int lIndex = stack.pop();

    pointer = lIndex;
    wall = pointer; 
    pivot = rIndex;    

    boolean running = true;
    while (running)
    {
      if (getValueQs(inputArray[pointer], mode) >= getValueQs(inputArray[pivot], mode))
      {
        pointer++;
      } 
      if (getValueQs(inputArray[pointer], mode) < getValueQs(inputArray[pivot], mode))
      {
        swap(inputArray, pointer, wall);
        pointer++;
        wall++;
      }
      if (pointer == pivot)
      {
        swap(inputArray, pivot, wall);
        if (lIndex < wall - 1)
        {
          stack.push(lIndex);
          stack.push(wall - 1);
        }
        if (wall + 1 < rIndex)
        {
          stack.push(wall + 1);
          stack.push(rIndex);
        }
        running = false;
      }
      continue;
    }
  }
  stack.clear();
  return inputArray;
}

void swap(int[] arr, int a, int b)
{
  int t = arr[a];
  arr[a] = arr[b];
  arr[b] = t;
}

float getValueQs(color c, int val)
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