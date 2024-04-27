void main() {
  //[0, 1, 1, 2, 3, 5, 8, 13, 21....]
  print('index: ${dynamicFibonacci(8)}');
}

dynamicFibonacci(int n) {
  int start = 0;
  int end = 1;
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result = start + end;
    start = end;
    end = result;
    print('$start , $end');
  }
  return result;
}
