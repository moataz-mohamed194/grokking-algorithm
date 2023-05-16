import 'package:stack/stack.dart';

void main(List<String> arguments) {
  Stack dynamicStack = Stack();

  // pushing items into the stack.
  dynamicStack.push(3);
  dynamicStack.push(4);
  dynamicStack.push(5);

  // popping the element at the top of the stack
  print(dynamicStack.pop());
  
  // printing the values of the items in the stack
  dynamicStack.print();
}