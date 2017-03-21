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
    //println(lIndex);
    //println(rIndex);

    //if (lIndex > rIndex)
    //{
    //  println("hey");
    //  continue;
    //}

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
        running = false;
      }
      continue;
    }
  }

  //for (int i = 0; i < inputArray.length; i++)
  //{
  //  //array[i] = (int)random(0, 10);
  //  if(inputArray.length <= 500)
  //  {
  //    print(inputArray[i] + ", ");
  //  }
  //}
      println();

  return inputArray;
}

void swap(int[] arr, int a, int b)
{
  int t = arr[a];
  arr[a] = arr[b];
  arr[b] = t;
}

////Stack<int> s = new Stack<int>(); 

//int[] quicksort(int[] inputArray) 
//{
//  int pivot = inputArray.length - 1;
//  int pointer = 0;
//  int wall = 0;
//  while (pointer < pivot)
//  {
//    if (inputArray[pointer] < inputArray[pivot])
//    {
//      swap(inputArray, pointer, wall);
//      wall++;
//      pointer++;
//      continue;
//    } else if (inputArray[pointer] >= inputArray[pivot])
//    {
//      pointer++;
//      continue;
//    }
//  }
//  int leftEnd = wall - 1;
//  int rightStart = wall + 1;
//    swap(inputArray, pivot, wall);

//  int[] leftArray = new int[leftEnd + 1];
//  arrayCopy(inputArray, 0, leftArray, 0, leftEnd + 1);

//  int[] rightArray = new int[pivot - wall];
//  arrayCopy(inputArray, rightStart, rightArray, 0, pivot - wall);

//  if (leftArray.length > 1)
//  {
//    int [] sortedLeftArray = doQuicksort(leftArray);
//    arrayCopy(sortedLeftArray, 0, inputArray, 0, sortedLeftArray.length);
//  }

//  if (rightArray.length > 1)
//  {
//    int [] sortedRightArray = doQuicksort(rightArray);        
//    arrayCopy(sortedRightArray, 0, inputArray, rightStart, sortedRightArray.length);
//  }

//  return inputArray;
//}

//void swap(int[] _inputArray, int a, int b)
//{
//  int temp = _inputArray[a];
//  _inputArray[a] = _inputArray[b];
//  _inputArray[b] = temp;
//}

//int [] doQuicksort(int[] array)
//{
//  return quicksort(array);
//}