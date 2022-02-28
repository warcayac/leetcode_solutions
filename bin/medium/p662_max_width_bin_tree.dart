import 'dart:math';

import 'package:collection/collection.dart';


void evaluateWidthOfBinaryTree(List<int?> root, [int level = 1]) {
  var expectedWidth = pow(2, level - 1) as int;

  if (root.isEmpty || SetEquality().equals(root.toSet(), {null})) {
    print('Maximum width: 0');
  } else {
    var leadingNodes = expectedWidth <= root.length 
      ? root.getRange(0, expectedWidth).toList()
      : root;
    var remainingNodes = expectedWidth <= root.length 
      ? root.getRange(expectedWidth, root.length).toList()
      : <int>[];

    if (remainingNodes.isNotEmpty) {
      evaluateWidthOfBinaryTree(
        remainingNodes, 
        level + 1 - leadingNodes.where((e) => e == null).length,
      );
    } else {
      var width = leadingNodes.length;
      if (width < expectedWidth && width.isOdd) width++;
      print('Maximum width: $width');
    }
  }
}

void main(List<String> args) {
  var data = [
    [1,3,2,5,3,null,9],
    [1,3,null,5,3],
    [1,3,2,5],
  ];
  evaluateWidthOfBinaryTree(data[0]); 
}