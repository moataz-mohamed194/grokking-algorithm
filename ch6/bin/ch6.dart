import 'dart:collection';

import 'package:ch6/ch6.dart' as ch6;

class Graph {
  final Map<Node, List<Node>> _adjacencyList;

  Graph() : _adjacencyList = {};

  void addNode(Node node) {
    _adjacencyList[node] = [];
  }

  void addEdge(Node node1, Node node2) {
    _adjacencyList[node1]?.add(node2);
  }

  List<Node> getNeighbors(Node node) {
    return _adjacencyList[node] ?? [];
  }

  void getData() {
    print(_adjacencyList);
  }

  List<Node>? breadthFirstSearch(Node start, Node end) {
    final queue = Queue<Node>();
    final visited = Set<Node>();
    final path = <Node, Node>{};

    queue.add(start);
    visited.add(start);

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      if (current == end) {
        final shortestPath = <Node>[end];
        Node? nextNode = end;
        while (nextNode != start) {
          shortestPath.add(path[nextNode]!);
          nextNode = path[nextNode];
        }
        return shortestPath.reversed.toList();
      }

      for (final neighbor in getNeighbors(current)) {
        if (!visited.contains(neighbor)) {
          queue.add(neighbor);
          visited.add(neighbor);
          path[neighbor] = current;
        }
      }
    }

    return null;
  }
}

class Node {
  final String value;

  Node(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Node && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return value;
  }
}

void main() {
  final graph = Graph();

  // Add nodes to the graph
  final nodeX = Node('X');
  final nodeA = Node('A');
  final nodeB = Node('B');
  final nodeC = Node('C');
  final nodeD = Node('D');
  final nodeE = Node('E');
  final nodeF = Node('F');
  graph.addNode(nodeA);
  graph.addNode(nodeB);
  graph.addNode(nodeC);
  graph.addNode(nodeD);
  graph.addNode(nodeE);
  graph.addNode(nodeF);
  graph.addNode(nodeX);

  // Add edges to the graph
  graph.addEdge(nodeX, nodeA);
  graph.addEdge(nodeX, nodeD);
  graph.addEdge(nodeA, nodeB);
  graph.addEdge(nodeD, nodeC);
  graph.addEdge(nodeC, nodeB);
  graph.addEdge(nodeD, nodeE);
  graph.addEdge(nodeE, nodeB);
  graph.addEdge(nodeB, nodeF);

  // Perform breadth-first search starting from nodeA
  final bfsResult = graph.breadthFirstSearch(nodeX, nodeF);
  print(bfsResult);
  graph.getData(); // [A, B, C, D, E, F]
}
