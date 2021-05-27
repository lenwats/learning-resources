# Intro to Algorithms

## Description
Notes regarding O notation and popular sorting algorithms


</br>

### Constant time operation

  - An operation that, for a given processor, always operates in the same amount of time, regardless of input values.
  - Assignment, multiplication, addition, subtraction, and division of fixed size integers or floats are constant time operations
  - Loops that iterate and add to each iteration are not constant time, however loops with a constant number of iterations can be
  - String concatenation is not constant time 
  - A for loop that does not have nested loops or function calls and does not modify i in the loop will always have a complexity of O(N)
  - Any constant number of constant time operations can collectively be considered 1 constant time operation.
  - ```
    x = 26.5
    y = 15.5	// 3 Constant time operations != O(3)
    z = x + y	// They are counted as one = O(1)
    ```



### O Notation

Given a function that describes the running time of an algorithm, the Big O notation for that function can be determined using the following rules:
  - If f(N) is a sum of several terms, the highest order term (the one with the fastest growth rate) is kept and others are discarded.
    
  - If f(N) has a term that is a product of several factors, all constants (those that are not in terms of N) are omitted.
    - Algorithm steps: 5 + 13N + 7N<sup>2</sup>
    - Big O notation: O(5 + 13N + 7N<sup>2</sup>) → O(n<sup>2</sup>)
        - Fastest growth order(7N<sup>2</sup>) is kept and others are discarded(5 + 13N)
<br/>

Runtime analysis determines the **total** number of operations
  - T in T(N) = time

</br>

### Big-O major sorting algorithms

| Sorting algorithm  | Average runtime complexity  | Fast?     |
|       ---          |             ---             |   ---     |
| Selection          | O(n<sup>2</sup>)            | No        |
| Insertion          | O(n<sup>2</sup>)            | No        |
| Shell              | O(n<sup>2</sup>)            | No        |
| Bubble             | O(n<sup>2</sup>)            | No        |
| Bucket             | O(n<sup>2</sup>)            | No        |
| Quicksort          | O(n logN)                   | Yes       |
| Merge              | O(n logN)                   | Yes       |
| Heap               | O(n logN)                   | Yes       |
| Radix              | O(n logN)                   | Yes       |


</br>

### Big-O time-complexity pseudocode

If the number of steps stays the name no matter how large n is, then it’s **constant** time: O(1):
  - ```
    FindMin(x, y):
        if(x > y) {
            return x
        } 
        else {
            return y
        }
    }
    ```
If you go through a n long list (**linearly**, e.g. a loop), then you’ll take at most n steps: O(n):
  - ```       
    LinearSearch(numbers, numbersSize, key) {
        for (i = 0; i < numbersSize; ++i) {
            if (numbers[i] == key) {
                return i
            }
        }   
        return -1 // not found
    }
    ```
If you through a n long list and then do n things each time (e.g. a loop inside a loop), then you’ll take at most n<sup>2</sup> steps: O(n<sup>2</sup>) (**quadratic** time)

The outer for loop iterates O(N) times. For each of these iterations, the inner for loop iterates O(N) times. The statements in the inner for loop have O(1) runtime. So, the runtime is: O(N) . (O(N) . O(1)) = O(n<sup>2</sup>)

But if you did the first and then second thing, n + n<sup>2</sup>, we call this O(n<sup>2</sup>)
<br/>
Logarithmic O(log N)
  - ```       
    BinarySearch(numbers, N, key) {
        mid = 0
        low = 0
        high = N - 1
        while (high >= low) {
            mid = (high + low) / 2
            if (numbers[mid] < key) {
                low = mid + 1
            }
            else if (numbers[mid] > key) {
                high = mid - 1
            }
            else {
                return mid
            }
        }  
    return -1   // not found
    }
    ```

Log-linear O(N log N)
  - The first N indicates the runtime complexity is linear, then multiplying with log N results in a log-linear runtime complexity.
  - ```       
    MergeSort(numbers, i, k) {
        j = 0
        if (i < k) {
            j = (i + k) / 2              // Find midpoint       
            MergeSort(numbers, i, j)     // Sort left part
            MergeSort(numbers, j + 1, k) // Sort right part
            Merge(numbers, i, j, k)      // Merge parts
        }
    }
    ```

Exponential O(c<sup>N</sup>)
  - ```       
    Fibonacci(N) {
        if ((1 == N) || (2 == N)) {
            return 1
        }
    return Fibonacci(N-1) + Fibonacci(N-2)
    }
    ```

As n gets big, n + n<sup>2</sup> will be very close to n<sup>2</sup>, so we only worry about the significant part. For the same reason, the notation is always simplified to ignore differences that will be insignificant as n gets large
  - For 1,200 steps we write O(1), not O(1200)
  - We write O(n), not O(2n) or O(3n)
  - We write O(n<sup>2</sup>), not O(2n<sup>2</sup>) or O(3n<sup>2</sup>)
  - We write O(n<sup>2</sup>), not O(2n<sup>2</sup> + n)
  - We write O(log n), not O(log<sub>10</sub>n)


An algorithm can have the same best and worst case, in which case the algorithm always does the same number of operations regardless of input data.

</br>

### Sorting algorithms

**Bubble**:
  - Look for something that swaps so the result can “bubble” to the top.
  - Ideal for small number of n
  - ```       
    BubbleSort(numbers, numbersSize) {
        for (i = 0; i < numbersSize - 1; i++) {
            for (j = 0; j < numbersSize - i - 1; j++) {
                if (numbers[j] > numbers[j+1]) {
                    temp = numbers[j]
                    numbers[j] = numbers[j + 1]
                    numbers[j + 1] = temp
                }
            }
        }
    }
    ```
<br/>


**Quickselect**:
  - ```       
    // Selects kth smallest element, where k is 0-based
    Quickselect(numbers, first, last, k) {
        if (first >= last)
            return numbers[first]

        lowLastIndex = Partition(numbers, first, last)

        if (k <= lowLastIndex)
            return Quickselect(numbers, first, lowLastIndex, k)
    return Quickselect(numbers, lowLastIndex + 1, last, k)
    }
    ```
<br/>


**Bucket**:
  - Look for something that distributes the values into “buckets” where they are individually sorted.
  - Useful when the input is uniformly distributed over the range
  - ```       
    BucketSort(numbers, numbersSize, bucketCount) {
        if (numbersSize < 1)
            return

        buckets = Create list of bucketCount buckets

        // Find the maximum value
        maxValue = numbers[0]
        for (i = 1; i < numbersSize; i++) {
            if (numbers[i] > maxValue)
                maxValue = numbers[i]
        }

        // Put each number in a bucket
        for each (number in numbers) {
            index = floor(number * (bucketCount - 1) / maxValue)
            Append number to buckets[index]
        }

        // Sort each bucket
        for each (bucket in buckets)
            Sort(bucket)

        // Combine all buckets back into numbers list
        result = Concatenate all buckets together
        Copy result to numbers
    }
    
    RadixSort(array, arraySize) {
        buckets = create array of 10 buckets

        // Find the max length, in number of digits
        maxDigits = RadixGetMaxLength(array, arraySize)
                
        // Start with the least significant digit
        pow10 = 1
        for (digitIndex = 0; digitIndex < maxDigits; digitIndex++) {
            for (i = 0; i < arraySize; i++) {
                bucketIndex = abs(array[i] / pow10) % 10
                Append array[i] to buckets[bucketIndex]
            }
            arrayIndex = 0
            for (i = 0; i < 10; i++) {
                for (j = 0; j < buckets[i].size(); j++)
                    array[arrayIndex++] = buckets[i][j]
            }
            pow10 = 10 * pow10
            Clear all buckets
        }
    }
    ```
<br/>


**Merge**:
  - Look for something that continually splits a list in half.
  - ```       
    Merge(numbers, i, j, k) {
        mergedSize = k - i + 1      			              // Size of merged partition
        mergePos = 0                		          // Position to insert merged number
        leftPos = 0           		            // Position of elements in left partition
        rightPos = 0        		           // Position of elements in right partition
        mergedNumbers = new int[mergedSize]         // Temporary array for merged numbers
        
        leftPos = i               		            // Initialize left partition position
        rightPos = j + 1         		           // Initialize right partition position

        // Add smallest element from left or right partition to merged numbers
        while (leftPos <= j && rightPos <= k) {
            if (numbers[leftPos] <= numbers[rightPos]) {
                mergedNumbers[mergePos] = numbers[leftPos]
                ++leftPos
            }
            else {
                mergedNumbers[mergePos] = numbers[rightPos]
                ++rightPos      
            }
            ++mergePos
        }
        
        // If left partition is not empty, add remaining elements to merged numbers
        while (leftPos <= j) {
            mergedNumbers[mergePos] = numbers[leftPos]
            ++leftPos
            ++mergePos
        }
        
        // If right partition is not empty, add remaining elements to merged numbers
        while (rightPos <= k) {
            mergedNumbers[mergePos] = numbers[rightPos]
            ++rightPos
            ++mergePos
        }
        
        // Copy merge number back to numbers
        for (mergePos = 0; mergePos < mergedSize; ++mergePos) {
            numbers[i + mergePos] = mergedNumbers[mergePos]
        }
    }

    MergeSort(numbers, i, k) {
        j = 0
        if (i < k) {
            j = (i + k) / 2  	                    // Find the midpoint in the partition

            // Recursively sort left and right partitions
            MergeSort(numbers, i, j)
            MergeSort(numbers, j + 1, k)

            // Merge left and right partition in sorted order
            Merge(numbers, i, j, k)
        }
    }
    ```
<br/>

**Quicksort**
  - Look for the keywords “pivot” and/or “split”.
  - Recursively breaks down a problem into two or more subproblems of the same or related type
  - ```
    Partition(numbers, lowIndex, highIndex) {
        // Pick middle element as pivot
        midpoint = lowIndex + (highIndex - lowIndex) / 2
        pivot = numbers[midpoint]
        
        done = false
        while (!done) {
            // Increment lowIndex while numbers[lowIndex] < pivot
            while (numbers[lowIndex] < pivot) {
                lowIndex += 1
            }
            
            // Decrement highIndex while pivot < numbers[highIndex]
            while (pivot < numbers[highIndex]) {
                highIndex -= 1
            }
            
            // If zero or one elements remain, then all numbers are 
            // partitioned. Return highIndex.
            if (lowIndex >= highIndex) {
                done = true
            }
            else {
                // Swap numbers[lowIndex] and numbers[highIndex]
                temp = numbers[lowIndex]
                numbers[lowIndex] = numbers[highIndex]
                numbers[highIndex] = temp
                
                // Update lowIndex and highIndex
                lowIndex += 1
                highIndex -= 1
            }
        }   
    return highIndex
    }

    Quicksort(numbers, lowIndex, highIndex) {
        // Base case: If the partition size is 1 or zero 
        // elements, then the partition is already sorted
        if (lowIndex >= highIndex) {
            return
        } 
        // Partition the data within the array. Value lowEndIndex 
        // returned from partitioning is the index of the low 
        // partition's last element.
        lowEndIndex = Partition(numbers, lowIndex, highIndex)
        
        // Recursively sort low partition (lowIndex to lowEndIndex) 
        // and high partition (lowEndIndex + 1 to highIndex)
        Quicksort(numbers, lowIndex, lowEndIndex)
        Quicksort(numbers, lowEndIndex + 1, highIndex)
    }
    ```
<br/>


**Shell**
  - Treats the input as a collection of interleaved lists, and sorts each list individually with a variant of insertion sort.
  - Uses gap values to determine the number of interleaved lists. A gap value is a positive integer representing the distance between elements in an interleaved list.
  - For each interleaved list, if an element is at index i, the next element is at index i + gap value.
  - ```
    InsertionSortInterleaved(numbers, numbersSize, startIndex, gap) {
        i = 0
        j = 0
        temp = 0  // Temporary variable for swap

        for (i = startIndex + gap; i < numbersSize; i = i + gap) {
            j = i
            while (j - gap >= startIndex && numbers[j] < numbers[j - gap]) {
                temp = numbers[j]
                numbers[j] = numbers[j - gap]
                numbers[j - gap] = temp
                j = j - gap
            }
        }
    }

    ShellSort(numbers, numbersSize, gapValues) {
        for each (gapValue in gapValues) {
            for (i = 0; i < gapValue; i++) {
                InsertionSortInterleaved(numbers, numbersSize, i, gapValue)
            }
        }
    }
    ```
<br/>

**Selection**
  - Treats the input as two parts, a sorted and unsorted part. 
  - Selection sort's runtime grows quadratically with the input size. If the input increases in size by X times, the runtime increases X2 times
    - How many times longer will sorting a list of 500 elements take compared to a list of 50 elements?
        - 500<sup>2</sup> / 50<sup>2</sup> = 250000 / 2500 = 100 times longer
  - Variables i and j keep track of the two parts. It searches the unsorted part of the array for the smallest element; indexSmallest stores the index of the smallest element found.
  - ```
    SelectionSort(numbers, numbersSize) { 
        for (i = 0; i < numbersSize; ++i) {
            // Find index of smallest remaining element
            indexSmallest = i
            for (j = i + 1; j < numbersSize; ++j) {
                if (numbers[j] < numbers[indexSmallest]) {
                    indexSmallest = j
                }
            }
            // Swap numbers[i] and numbers[indexSmallest]      
            temp = numbers[i]
            numbers[i] = numbers[indexSmallest]
            numbers[indexSmallest] = temp
        }
    }
    ```
<br/>

**Insertion**
  - Treats the input as two parts, a sorted part and an unsorted part, and repeatedly inserts the next value from the unsorted part into the correct location in the sorted part.
  - Sorting a list of 20 elements will take 4 times longer than sorting a list of 10 elements
    - 20<sup>2</sup> / 10<sup>2</sup> = 400 / 100 = 4.
  - ```
    for (i = 1; i < numbersSize; ++i) {
        j = i
        // Insert numbers[i] into sorted part 
        // stopping once numbers[i] in correct position
        while (j > 0 && numbers[j] < numbers[j - 1]) {
                
            // Swap numbers[j] and numbers[j - 1]
            temp = numbers[j]
            numbers[j] = numbers[j - 1]
            numbers[j - 1] = temp
            --j
        }
    }
    ```