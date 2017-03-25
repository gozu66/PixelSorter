import java.util.ArrayDeque;

ArrayDeque<Integer> stack = new ArrayDeque<Integer>();

color[] quicksort(color[] inputArray)
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
      if (brightness(inputArray[pointer]) >= brightness(inputArray[pivot]))
      {
        pointer++;
      } 
      if (brightness(inputArray[pointer]) < brightness(inputArray[pivot]))
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