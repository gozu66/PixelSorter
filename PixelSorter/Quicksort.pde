import java.util.ArrayDeque; //<>// //<>//

ArrayDeque<Integer> stack = new ArrayDeque<Integer>();

int[] quicksort(int[] inputArray)
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
      if (inputArray[pointer] >= inputArray[pivot])
      {
        pointer++;
      } 
      if (inputArray[pointer] < inputArray[pivot])
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
        //return inputArray;    //????????
        running = false;
      }
      continue;
    }
  }

  return inputArray;
}

void swap(int[] arr, int a, int b)
{
  int t = arr[a];
  arr[a] = arr[b];
  arr[b] = t;
}

//int[] quicksort(int[] inputArray)
//{
//  stack.push(0);
//  stack.push(inputArray.length - 1);

//  int pointer, wall, pivot;

//  while (stack.size() > 0)
//  {

//    int rIndex = stack.pop();
//    int lIndex = stack.pop();

//    pointer = lIndex;
//    wall = pointer; 
//    pivot = rIndex;    
//    boolean running = true;
//    while (running)
//    {
//      if (inputArray[pointer] >= inputArray[pivot])
//      {
//        pointer++;
//      } 
//      if (inputArray[pointer] < inputArray[pivot])
//      {
//        swap(inputArray, pointer, wall);
//        pointer++;
//        wall++;
//      }
//      if (pointer == pivot)
//      {

//        swap(inputArray, pivot, wall);
//        if (lIndex < wall - 1)
//        {
//          stack.push(lIndex);
//          stack.push(wall - 1);
//        }
//        if (wall + 1 < rIndex)
//        {
//          stack.push(wall + 1);
//          stack.push(rIndex);
//        }
//        running = false;
//      }
//      continue;
//    }
//  }

//  //for (int i = 0; i < inputArray.length; i++)
//  //{
//  //  //array[i] = (int)random(0, 10);
//  //  if(inputArray.length <= 500)
//  //  {
//  //    print(inputArray[i] + ", ");
//  //  }
//  //}
//      println();

//  return inputArray;
//}