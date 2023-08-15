import 'dart:collection';

class WeightedGraph {
  final Map<Node, List<Edge>> _adjacencyList;

  WeightedGraph() : _adjacencyList = {};

  void addNode(Node node) {
    _adjacencyList[node] = [];
  }

  void addEdge(Node node1, Node node2, int weight) {
    final edge = Edge(node1, node2, weight);
    _adjacencyList[node1]?.add(edge);
  }

  List<Edge> getNeighbors(Node node) {
    return _adjacencyList[node] ?? [];
  }

  void getData() {
    for (dynamic x in _adjacencyList.keys) {
      print(x);
      for (Edge x2 in _adjacencyList[x]!) {
        print("${x2.node1} -> ${x2.node2} : ${x2.weight}");
      }
    }
  }

  String convertToString(String input){

    input = input.replaceAll(RegExp(r'[\[\]\d]+'), '');
    List<String> items = input.split(",").map((item) => item.trim()).where((item) => item.isNotEmpty).toSet().toList();
    String output = items.join(", ");

    return output;
  }
  MapEntry<String, int> dijkstra(Node startNode, Node endNode) {
    Map<String, int> distances = {};
    final queue = Queue<Map<Node, String>>();
    bool getOut = false;
    for (int i = 0; i < _adjacencyList[startNode]!.length; i++) {
      var data = _adjacencyList[startNode];
      queue.add({
        _adjacencyList[startNode]![i].node2:
            '${data![i].node1},${data[i].node2},${data[i].weight}'
      });
    }
    while (getOut != true) {
      final current = queue.removeFirst();
      final data = getNeighbors(current.keys.first);
      for (int i = 0; i < data.length; i++) {
        List<String> currentList = current.values.first.split(',');
        String output = "${convertToString(current.values.first)},${data[i].node2}";
        int total = int.parse(currentList[currentList.length - 1]) + data[i].weight;

        if (data[i].node2.toString() == endNode.value.toString()){
          distances.addAll({output:total});
        }
        queue.add({
          data[i].node2:
          '$currentList,${data[i].node1},${data[i].node2},$total'
        });
      }
      if (queue.length.toInt() == 0){
      getOut = true;
        }
    }
    final maxEntry = distances.entries.reduce((a, b) => a.value < b.value ? a : b);
    return maxEntry;
  }
}

class Node {
  final String value;

  Node(this.value);

  @override
  String toString() {
    return value;
  }
}

class Edge {
  final Node node1;
  final Node node2;
  final int weight;

  Edge(this.node1, this.node2, this.weight);
  String display() {
    return '${node1.value} -> ${node2.value} : $weight';
  }
}

void main() {
  final WeightedGraph graph = WeightedGraph();
  final Node nodeBook = Node('Book');
  final Node nodeLP = Node('LP');
  final Node nodeGuitar = Node('Guitar');
  final Node nodePoster = Node('Poster');
  final Node nodeDrum = Node('Drum');
  final Node nodePiano = Node('Piano');

  graph.addNode(nodeBook);
  graph.addNode(nodeLP);
  graph.addNode(nodeGuitar);
  graph.addNode(nodePoster);
  graph.addNode(nodeDrum);
  graph.addNode(nodePiano);

  graph.addEdge(nodeBook, nodeLP, 5);
  graph.addEdge(nodeBook, nodePoster, 0);
  graph.addEdge(nodeLP, nodeGuitar, 15);
  graph.addEdge(nodeLP, nodeDrum, 20);
  graph.addEdge(nodePoster, nodeGuitar, 30);
  graph.addEdge(nodePoster, nodeDrum, 35);
  graph.addEdge(nodeGuitar, nodePiano, 20);
  graph.addEdge(nodeDrum, nodePiano, 10);
  // graph.getData();
  print('-----');

  print(graph.dijkstra(nodeBook, nodeDrum)); // Output: [
}


// void main() {
//   final WeightedGraph graph = WeightedGraph();
//   final Node nodex = Node('x');
//   final Node nodea = Node('a');
//   final Node nodeb = Node('b');
//   final Node nodec = Node('c');
//   final Node noded = Node('d');
//   final Node nodee = Node('e');
//   final Node nodef = Node('f');
//
//   graph.addNode(nodex);
//   graph.addNode(nodea);
//   graph.addNode(nodeb);
//   graph.addNode(nodec);
//   graph.addNode(noded);
//   graph.addNode(nodee);
//   graph.addNode(nodef);
//
//   graph.addEdge(nodex, nodea, 4);
//   graph.addEdge(nodex, nodec, 10);
//   graph.addEdge(nodea, nodeb, 21);
//   graph.addEdge(nodec, nodee, 5);
//   graph.addEdge(nodec, noded, 8);
//   graph.addEdge(nodee, nodeb, 5);
//   graph.addEdge(noded, nodeb, 12);
//   graph.addEdge(nodeb, nodef, 4);
//   graph.getData();
//   print('-----');
//
//   print(graph.dijkstra(nodex, nodef)); // Output: [
// }
