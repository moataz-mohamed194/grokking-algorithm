void main(List<String> arguments) {
  print(factorial(6));
}
int factorial(int n) {
  print('-${n}');

  if (n == 0) {
    return 1;
  } else {
    // print('-${n-1}');
    return n * factorial(n - 1);
  }
}
