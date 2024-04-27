void main(List<String> arguments) {
  //[0, 1, 1, 2, 3, 5, 8, 13, ....]
  print('index: ${recursiveFibonacci(6)}');
}

recursiveFibonacci(int n) {
  if (n < 2) {
    return n;
  }
  return recursiveFibonacci(n - 1) + recursiveFibonacci(n - 2);
}
