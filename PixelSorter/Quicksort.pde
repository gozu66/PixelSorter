ArrayList <color[]> cols = new ArrayList<color[]>(); //<>//


color[] quicksort(color[] inputArray)
{
  color[] arrayToSort = inputArray;
  boolean sorting = true;
  while (sorting)
  {
    int pivot = arrayToSort.length - 1;
    int pointer = 0;
    int wall = 0;

    while (pointer < pivot)
    {
      if (brightness(arrayToSort[pointer]) > brightness(arrayToSort[pivot]))
      {
        swap(arrayToSort, pointer, wall);
        wall++;
        pointer++;
        continue;
      } else if (brightness(arrayToSort[pointer]) <= brightness(arrayToSort[pivot]))
      {
        pointer++;
        continue;
      }
    }
    int leftEnd = wall - 1;
    int rightStart = wall + 1;
    swap(arrayToSort, pivot, wall);

    int[] leftArray = new int[leftEnd + 1];
    arrayCopy(arrayToSort, 0, leftArray, 0, leftEnd + 1);

    int[] rightArray = new int[pivot - wall];
    arrayCopy(arrayToSort, rightStart, rightArray, 0, pivot - wall);

    arrayCopy(leftArray, 0, inputArray, 0, leftArray.length);
    //arrayCopy(rightArray, 0, inputArray, 0, rightArray.length);

    //
    if (leftArray.length <= 1)
    {
      cols.add(rightArray);
      //use left array on next loop
      arrayToSort = leftArray;
    } else 
    {
      if (cols.size() > 0)
      {
        arrayToSort = cols.get(cols.size() - 1);    
        cols.remove(cols.size() - 1);          //?????
      } else
      {
        sorting = false;
        continue;
      }
    }
    //if (leftArray.length > 1)
    //{
    //int [] sortedLeftArray = doQuicksort(leftArray);
    //arrayCopy(sortedLeftArray, 0, inputArray, 0, sortedLeftArray.length);
    //}

    //if (rightArray.length > 1)
    //{
    //  //int [] sortedRightArray = doQuicksort(rightArray);        
    //  //arrayCopy(sortedRightArray, 0, inputArray, rightStart, sortedRightArray.length);
    //}
  }
  return inputArray;
}


void swap(color[] _inputArray, color a, color b)
{
  color temp = _inputArray[a];
  _inputArray[a] = _inputArray[b];
  _inputArray[b] = temp;
}

/*******************************
 int [] doQuicksort(int[] array)
 {
 return quicksort(array);
 }
 *******************************/