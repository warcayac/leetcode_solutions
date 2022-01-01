import 'dart:math';

import 'package:leetcode/src/permutation.dart';

class Node {
  Node? prior, next;
  final int value;
  bool active = true;
  /* ---------------------------------------------------------------------------- */
  Node(this.value);
  /* ---------------------------------------------------------------------------- */
  int leftValue() {
    var result = prior == null
      ? 1
      : prior!.active
        ? prior!.value
        : prior!.leftValue();
    return result;
  }
  /* ---------------------------------------------------------------------------- */
  int rightValue() {
    var result = next == null
      ? 1
      : next!.active
        ? next!.value
        : next!.rightValue();
    return result;
  }
  /* ---------------------------------------------------------------------------- */
  int get weight => leftValue() * value * rightValue();
  /* ---------------------------------------------------------------------------- */
}


List<int> orderBy(List<int> path, List<int> ballons) {
  var result = <int>[];
  path.forEach((i) => result.add(ballons[i]));
  return result;
}

int burstBallons(List<int> path, List<Node> ballons) {
  var result = 0;

  path.forEach((i) {
    result += ballons[i].weight;
    ballons[i].active = false;
  });

  return result;
}


void maxCoins(List<int> ballons) {
  var length = ballons.length;
  var nodes = List.generate(length, (i) => Node(ballons[i]));
  for (var i = 0; i < length; i++) {
    if (i > 0) nodes[i].prior = nodes[i-1];
    if (i < length - 1) nodes[i].next = nodes[i+1];
  }
  var paths = getPermutations<int>(List.generate(ballons.length, (i) => i));
  var dic = Map.fromIterables(paths, paths.map((p) {
    var result = burstBallons(p, nodes);
    nodes.forEach((n) => n.active = true);
    return result;
  }));
  var maxValue = dic.values.reduce(max);
  dic
    ..removeWhere((k, v) => v != maxValue)
    ..forEach((k, v) => print('${orderBy(k, ballons)} ==> coins : $v'));
}

void main(List<String> args) {
  maxCoins([3,1,5,8]);
  maxCoins([1,5]);
  print('\nDone!');
}