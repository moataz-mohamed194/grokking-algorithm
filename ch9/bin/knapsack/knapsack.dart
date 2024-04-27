import 'dart:math';

class Item {
  String name;
  int weight;
  int value;

  Item(this.name, this.weight, this.value);
}

List<Item> knapsack(List<Item> items, int capacity) {
  int n = items.length;

  int maxVal = knapsackRecursive(items, n, capacity);
  List<Item> selectedItems = findSelectedItems(items, n, capacity);

  print("Maximum value: $maxVal");
  print("Selected items:");
  for (var item in selectedItems) {
    print("${item.name} (Weight: ${item.weight}, Value: ${item.value})");
  }

  return selectedItems;
}

int knapsackRecursive(List<Item> items, int n, int capacity) {
  if (n == 0 || capacity == 0) {
    return 0;
  }

  if (items[n - 1].weight > capacity) {
    return knapsackRecursive(items, n - 1, capacity);
  } else {
    int includeItem = items[n - 1].value +
        knapsackRecursive(items, n - 1, capacity - items[n - 1].weight);
    int excludeItem = knapsackRecursive(items, n - 1, capacity);
    return max(includeItem, excludeItem);
  }
}

List<Item> findSelectedItems(List<Item> items, int n, int capacity) {
  List<Item> selectedItems = [];
  int w = capacity;
  for (int i = n; i > 0 && w > 0; i--) {
    if (knapsackRecursive(items, i, w) != knapsackRecursive(items, i - 1, w)) {
      selectedItems.add(items[i - 1]);
      w -= items[i - 1].weight;
    }
  }
  return selectedItems;
}

void main() {
  List<Item> items = [
    Item("guitar", 1, 1500),
    Item("laptop", 3, 2000),
    Item("stereo", 4, 3000)
  ];

  int capacity = 4;

  knapsack(items, capacity);
}
