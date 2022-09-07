import 'package:leetcode/src/binary_tree.dart';


class Solution {
  String tree2str(TreeNode? root) {
    var result = _path(root);
    // print(result);
    return result;
  }

  String _path(TreeNode? root) {
    var proot = root?.val.toString() ?? '';
    var psub = '';
    
    if (root != null && (root.left != null || root.right != null)) {
      var pleft = _path(root.left);
      var pright = _path(root.right);
      if (pright.isNotEmpty) pright = '($pright)';
      psub = '($pleft)$pright';
    }

    return '$proot$psub';
  }
}

void main(List<String> args) {
  Solution()
  ..tree2str(TreeNode.buildBinaryTree([1,2,3,4]))
  ..tree2str(TreeNode.buildBinaryTree([1,2,3,null,4]))
  ;
}