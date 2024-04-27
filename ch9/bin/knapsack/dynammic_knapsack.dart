import 'dart:math';
class Item {
  String name;
  int weight;
  int price;

  Item(this.name, this.weight, this.price);
}

List<Item> knapsack(List<Item> items, int capacity) {
  int n = items.length;
  List<List<int>> dp =
      List.generate(n + 1, (i) => List<int>.filled(capacity + 1, 0));
  for (int i = 0; i <= n; i++) {
    for (int w = 0; w <= capacity; w++) {
      if (i == 0 || w == 0) {
        dp[i][w] = 0;
      } else if (items[i - 1].weight <= w) {
        dp[i][w] = max(items[i - 1].price + dp[i - 1][w - items[i - 1].weight],
            dp[i - 1][w]);
      } else {
        dp[i][w] = dp[i - 1][w];
      }
    }
  }

  List<Item> selectedItems = [];
  int i = n;
  int w = capacity;
  while (i > 0 && w > 0) {
    if (dp[i][w] != dp[i - 1][w]) {
      selectedItems.add(items[i - 1]);
      w -= items[i - 1].weight;
    }
    i--;
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

  List<Item> selectedItems = knapsack(items, capacity);

  print("Selected items:");
  for (var item in selectedItems) {
    print("${item.name} (Weight: ${item.weight}, Price: ${item.price})");
  }
}
