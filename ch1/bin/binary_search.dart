
void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int target = 7;
  int result = binarySearch(arr, target, 0, arr.length - 1);
  if (result == -1) {
    print("Element not found");
  } else {
    print("Element found at index $result");
  }
}

int binarySearch(List<int> arr, int target, int left, int right) {
  if (right >= left) {
    //get the mid number
    int mid = left + ((right - left) ~/ 2);

    if (arr[mid] == target) {
      return mid;
      // if the number of mid index greater than target
    } else if (arr[mid] > target) {
      //change the left with the mid index
      return binarySearch(arr, target, left, mid - 1);
    } else {
      //change the right with the mid index
      return binarySearch(arr, target, mid + 1, right);
    }
  }
  return -1;
}

