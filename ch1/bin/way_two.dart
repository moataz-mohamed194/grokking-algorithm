
void main() {
  List<int> arr = [0, 1, 3, 4, 5, 8, 9, 22];
  int userValue = 8;
  print(binarySearch(arr, userValue));
}

binarySearch(List<int> arr, int item) {
  //start with first index
  int min = 0;
  //end with last index
  int max = arr.length - 1;
  while (min <= max) {
    //get the mid
    int mid = max + min;
    int guess = arr[mid];
    if (guess == item) {
      return mid;
    }
    //check if the number of mid index
    if (guess > item) {
      max = mid - 1;
    } else {
      min = mid + 1;
    }
  }
  return Null;
}