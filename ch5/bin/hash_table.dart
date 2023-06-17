import 'dart:collection';

void main(List<String> arguments) {
  final Map<String, int> planets = HashMap(); // Is a HashMap
  planets['apple'] = 5;
  planets['apple1'] = 5;
  planets.addAll({'banaba': 40});
  final gasGiants = {'pen': 2, 'book': 100};
  planets.addEntries(gasGiants.entries);
  print(planets); //{banaba: 40, apple: 5, book: 100, pen: 2, apple1: 5}

  //remove item of hashmap
  planets.remove('apple1');
  print(planets); //{banaba: 40, apple: 5, book: 100, pen: 2}

  //update item of hashmap
  planets.update('apple', (value) => 111);
  print(planets);//{banaba: 40, apple: 111, book: 100, pen: 2}

  //clear hashmap
  planets.clear();
  print(planets);//{}
}
