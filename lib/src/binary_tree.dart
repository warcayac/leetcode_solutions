// https://www.geeksforgeeks.org/difference-between-graph-and-tree/

// Definition for a binary tree node
// Estructura base dada por LeetCode
import 'dart:math';

class TreeNode {
  static TreeNode? buildBinaryTree(List<int?> values) {
    // if (values.length.isEven) return null;
    TreeNode? root;
    var index = 0;
    var parents = <TreeNode?>[];
    final length = values.length;
    
    while (index < values.length) {
      var items2Take = pow(2, parents.length) as int;
      var children = List.generate(
        index + items2Take > length ? length - index : items2Take,
        (i) => values[index + i] != null ? TreeNode(values[index + i]!) : null,
      );

      if (root != null) {
        for (var i = 0; i < parents.length; i++) {
          var idx = 2 * i;
          var limit = children.length;
          if (idx < limit) parents[i]!.left = children[2*i];
          if (idx+1 < limit) parents[i]!.right = children[2*i+1];
        }
      } else {
        root = children.first;
      }
      parents = children.where((e) => e != null).toList();
      index += items2Take;
    }
    return root;
  }

  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);

  @override
  String toString() => '$val=>(L:$left, R:$right)';
}
