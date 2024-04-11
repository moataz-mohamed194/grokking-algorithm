
void main(List<String> arguments) {
  Set<String> stateNeeded = {"mt", "wa", "or", "id", "nv", "ut", "ca", "az"};
  Map<String, Set<String>> states = {
    'kone': {'id', 'nv', 'ut'},
    'ktwo': {'wa', 'id', 'mt'},
    'kthree': {'or', 'nv', 'ca'},
    'kfour': {'nv', 'ut'},
    'kfive': {'ca', 'az'},

    // 'a': {'q', 'w', 'e'},
    // 's': {'r', 'q', 't'},
    // 'x': {'h', 'w', 'b'},
    // 'z': {'w', 'e'},
    // 'd': {'b', 'p'}
  };
  final result = findSetCover(stateNeeded, states);
  print('Minimum Set Cover: $result');
}

Set<String> findSetCover(Set<String> elements, Map<String, Set<String>> subsets) {
  final uncovered = elements.toSet();
  final setCover = <String>{};
  print('uncovered:$uncovered');
  print('setCover:$setCover');

  while (uncovered.isNotEmpty) {
    final bestSubset = getBestSubset(elements, subsets, uncovered);
    setCover.add(bestSubset);
    uncovered.removeAll(subsets[bestSubset]!);
    print('uncovered2:$uncovered');
    print('setCover2:$setCover');

  }

  return setCover;
}

String getBestSubset(
    Set<String> elements, Map<String, Set<String>> subsets, Set<String> uncovered) {
  var bestSubset = '';
  var bestCovered = <String>{};
  for (final subset in subsets.keys) {
    final covered = subsets[subset]!.intersection(uncovered);
    if (covered.length > bestCovered.length) {
      bestSubset = subset;
      bestCovered = covered.toSet();
    }
  }
  print('bestSubset:$bestSubset');
  return bestSubset;
}