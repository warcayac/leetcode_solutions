import 'package:leetcode/src/binary_tree.dart';

class Solution {
  List<double> averageOfLevels(TreeNode? root) {
    var data = <int,List<int>>{};
    exportToJson(root, data);
    var result = data.values.map((list) => list.reduce((a, b) => a+b)/list.length).toList();
    print(result);
    return result;
  }
  void exportToJson(TreeNode? node, Map<int,List<int>> data, [int level = 0]) {
    if (node == null) return;

    data[level] ??= [];
    data[level]!.add(node.val);
    exportToJson(node.left, data, level + 1);
    exportToJson(node.right, data, level + 1);
  }
}

void main(List<String> args) {
  Solution()
  ..averageOfLevels(TreeNode.buildBinaryTree([3,9,20,null,null,15,7]))
  ..averageOfLevels(TreeNode.buildBinaryTree([3,9,20,15,7]))
  ;
}