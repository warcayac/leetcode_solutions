import 'package:leetcode/src/graph.dart';

// source: https://leetcode.com/problems/minimum-height-trees/
void main(List<String> args) {
  const numNodes = 6;
  var graph = Graph(
    nodes: List.generate(numNodes, (i) => Node(data: BasicData(i))),
    isDirected: false,
  );
  graph
    ..addLinks(source: 3, targets: [0,1,2,4])
    ..addLinks(source: 5, targets: [4])
    
    // ..addLinks(source: 0, targets: [1])
    // ..addLinks(source: 1, targets: [2,3])

    // ..addLinks(source: 0, targets: [1,3])
    // ..addLinks(source: 1, targets: [2])
    // ..addLinks(source: 2, targets: [0])
    // ..addLinks(source: 3, targets: [2])
  ;
  
  // graph.toMatrix().forEach(print);
  graph.findNodesWithMinimumHeightTrees();
  print('\nDone!');
}