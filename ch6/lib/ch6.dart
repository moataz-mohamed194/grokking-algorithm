import 'dart:collection';

class Graph {
  final Map<String, List<String>> _adjacencyList;

  Graph() : _adjacencyList = {};

  //add the head of graph
  void addNode(String node) {
    _adjacencyList[node] = [];
  }

  //Add the edges to node
  void addEdge(String node1, String node2) {
    _adjacencyList[node1]?.add(node2);
  }

  //get all edges for one node
  List<String> getNeighbors(String node) {
    return _adjacencyList[node] ?? [];
  }

  void getAllDataOfNodes(){
    print(_adjacencyList.toString());
  }

  List<String> getNodeByValue(String value) {
    return _adjacencyList[value]??[];
    // return _adjacencyList[value]!.toList().firstWhere((node) => node. == value, orElse: () => null);
  }
}

Queue<String> bfs(Graph graph, String startNode) {
    var visited = <String>{};
    var queue = Queue<String>();
    bool foundAsHead = false;
    bool foundAsEdge = false;
    visited.add(startNode);
    queue.add(startNode);

    while (queue.isNotEmpty) {
      var currentNode = queue.removeFirst();

      var neighbors = graph.getNeighbors(currentNode);
      print(neighbors);
      for (var neighbor in neighbors) {
        // print(neighbor);
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
          foundAsHead = true;
          }
      }
      print('visited:$visited');
      print('queue:$queue');

      // for()
      return queue;
    }

    return queue;
  }
void main(List<String> arguments) {
  final graph = Graph();

  graph.addNode("1");
  graph.addNode("4");
  graph.addNode("7");
  graph.addNode("6");
  graph.addNode("10");

  // Add edges to the graph
  graph.addEdge("1", "2");
  graph.addEdge("1", "3");
  graph.addEdge("4", "5");
  graph.addEdge("4", "6");
  graph.addEdge("7", "8");
  graph.addEdge("7", "9");
  graph.addEdge("10", "11");
  graph.addEdge("10", "12");

  graph.getAllDataOfNodes();
  // final da = bfs(graph, "2");
  // print(bfs(graph, "4"));
}
