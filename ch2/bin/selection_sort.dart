void selectionSort(var L) {
  var n = L.length;
  for (var i = 0; i < n - 1; i++) {
    var index_min = i;
    for (var j = i + 1; j < n; j++) {
      if (L[j] < L[index_min]) {
        index_min = j;
      }
    }
    if (index_min != i) {
      var temp = L[i];
      L[i] = L[index_min];
      L[index_min] = temp;
    }
  }
}
void main() {
  var lst = [3,5,6,2,10];
  print("Before sort lst: ${lst}");
  selectionSort(lst);
  print("After sort lst: ${lst}");
}
