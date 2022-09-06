import 'package:leetcode/src/binary_tree.dart';

class Solution {
  TreeNode? pruneTree(TreeNode? root) {
    _validateSubTree(root);
    if (root != null && root.val == 0 && root.left == null && root.right == null) root = null;

    // var treeMap = <int, List<int?>>{};
    // _validateSubTreeWithMap(root, treeMap);
    // var result = <int?>[];
    // treeMap.values.forEach((e) => result.addAll(e));
    // print(result);
    
    print(root);
    return root;
  }

  TreeNode? _validateSubTree(TreeNode? root) {
    var result = false;

    if (root != null) {
      var isOne = root.val == 1;
      root.left = _validateSubTree(root.left);
      root.right = _validateSubTree(root.right);
      var childrenExist = root.left != null || root.right != null;
      result = isOne || childrenExist;
    }

    return result ? root : null;
  }

  TreeNode? _validateSubTreeWithMap(TreeNode? root, Map<int, List<int?>> treeMap, [int level = 0]) {
    treeMap[level] ??= <int?>[];
    
    var result = false;
    int? input;

    if (root != null) {
      var isOne = root.val == 1;
      root.left = _validateSubTreeWithMap(root.left, treeMap, level + 1);
      root.right = _validateSubTreeWithMap(root.right, treeMap, level + 1);
      var childrenExist = root.left != null || root.right != null;
      result = isOne || childrenExist;
      input = result ? root.val : null;
    }

    treeMap[level]!.isNotEmpty && input == null && treeMap[level]!.last == null
      ? treeMap[level]!.removeLast()
      : treeMap[level]!.add(input);

    return result ? root : null;
  }
}

void main(List<String> args) {
  Solution()
  ..pruneTree(TreeNode.buildBinaryTree([1,null,0,0,1]))
  ..pruneTree(TreeNode.buildBinaryTree([1,0,1,0,0,0,1]))
  ..pruneTree(TreeNode.buildBinaryTree([1,1,0,1,1,0,1,0]))
  ..pruneTree(TreeNode.buildBinaryTree([0,null,0,0,0]))
  ;
}