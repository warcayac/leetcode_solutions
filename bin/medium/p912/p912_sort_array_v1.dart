import 'sample_1.dart';

class Node {
  final int value;
  Node? prior, next;
  /* ---------------------------------------------------------------------------- */
  Node(this.value);
  /* ---------------------------------------------------------------------------- */
  void compare(int number) {
    value <= number ? this <= Node(number) : this > Node(number);
  }
  /* ---------------------------------------------------------------------------- */
  bool operator <=(Node other) {
    var isTrue = value <= other.value;
    isTrue ? withNext(other) : withPrior(other);
    return isTrue;
  }
  /* ---------------------------------------------------------------------------- */
  bool operator >(Node other) {
    var isTrue = other.value < value;
    isTrue ? withPrior(other) : withNext(other);
    return isTrue;
  }
  /* ---------------------------------------------------------------------------- */
  void withPrior(Node other) {
    prior != null
      ? prior! > other
      : prior = other;
  }
  /* ---------------------------------------------------------------------------- */
  void withNext(Node other) {
    next != null
      ? next! <= other
      : next = other;
  }
  /* ---------------------------------------------------------------------------- */
  List<int> getValues() {
    var result = <int>[];
    if (prior != null) result.addAll(prior!.getValues());
    result.add(value);
    if (next != null) result.addAll(next!.getValues());
    
    return result;
  }
  /* ---------------------------------------------------------------------------- */
  @override
  String toString() {
    return '{${prior ?? '?'}} ($value) {${next ?? '?'}}';
  }
}

class Solution {
  /* ---------------------------------------------------------------------------- */
  List<int> sortArray(List<int> nums) {
    if (nums.length < 2) return nums;
    
    var root = Node(nums.first);
    for (var i = 1; i < nums.length; i++) {
      root.compare(nums[i]);
    }
    
    return root.getValues();
  }
  /* ---------------------------------------------------------------------------- */
  void sortArray2(List<int> nums) {
    print(sortArray(nums));
    print('='*80);
  }
  /* ---------------------------------------------------------------------------- */
}
void main(List<String> args) {
  // ignore: avoid_single_cascade_in_expression_statements
  Solution()
  // ..sortArray2([5,4,7,2,11,14,6]) // [2, 4, 5, 6, 7, 11, 14]
  // ..sortArray2([5,2,3,1]) // [1,2,3,5]
  // ..sortArray2([5,1,1,2,0,0]) // [0,0,1,1,2,5]
  ..sortArray2(arr1)
  ;
}