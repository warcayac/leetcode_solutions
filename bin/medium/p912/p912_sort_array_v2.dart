import 'dart:io';

import 'sample_1.dart';
import 'sample_2.dart';

class Node {
  static int minimum = 0;
  static int maximum = 0;
  /* ---------------------------------------------------------------------------- */
  final int value;
  var inList = false;
  Node? parent, prior, next;
  /* ---------------------------------------------------------------------------- */
  Node(this.value);
  /* ---------------------------------------------------------------------------- */
  Node compare(int number, Node? previous) {
    var other = Node(number);
    var curNode = this;
    
    if (previous != null) {
      if (
        (previous.value == maximum && previous.value <= number) 
        || (number < previous.value && previous.value == minimum)
      ) curNode = previous;
    }

    if (maximum < number) maximum = number;
    if (number < minimum) minimum = number;

    do {
      curNode = curNode <= other;
    } while (curNode != other);

    return other;
  }
  /* ---------------------------------------------------------------------------- */
  Node operator <=(Node other) {
    if (value <= other.value) {
      if (next == null) {
        next = other;
        next!.parent = this;
      }
      return next!;
    }
    
    if (prior == null) {
      prior = other;
      prior!.parent = this;
    }
    return prior!;
  }
  /* ---------------------------------------------------------------------------- */
  static Iterable delete(Node node) {
    if (node.prior != null) return [node.prior, null];

    var data = node.inList ? null : node.value;
    Node? result;

    node.inList = true;
    if (node.next != null) {
      result = node.next;
      if (node.parent == null) {
        node
        ..next?.parent = null
        ..prior = null
        ..next = null
        ..parent = null
        ;
      }
      return [result, data];
    }
    
    result = node.parent;
    if (result != null) result.prior == node ? result.prior = null : result.next = null;
    node
      ..prior = null
      ..next = null
      ..parent = null
    ;

    return [result,data];
  }
  /* ---------------------------------------------------------------------------- */
  static List<int> getSortedList(Node root) {
    var list = <int>[];
    Iterable result = [root,null];
    do {
      // print('current node: ${(result.first as Node).value}, ${(result.first as Node).inList}\t  =>  $list');
      result = delete(result.first);
      if (result.last != null) list.add(result.last);
    } while (result.first != null);

    return list;
  }
  /* ---------------------------------------------------------------------------- */
  @override
  String toString() {
    return '{${prior ?? '?'}} ($value) {${next ?? '?'}}';
    // return '${prior ?? ''} $value ${next ?? ''}';
  }
}

class Solution {
  var takeRunTime = true;
  /* ---------------------------------------------------------------------------- */
  List<int> sortArray(List<int> nums) {
    if (nums.length < 2) return nums;
    
    var root = Node(nums.first);
    Node? previous;
    Node.minimum = root.value;
    Node.maximum = root.value;
    var sw = Stopwatch();
    if (takeRunTime) {
      stdout.write('Building the tree... ');
      sw.start();
    }
    for (var i = 1; i < nums.length; i++) {
      previous = root.compare(nums[i], previous);
    }
    if (takeRunTime) {
      sw.stop();
      stdout.writeln('${sw.elapsedMilliseconds} ms');
      sw.reset();
      stdout.write('Getting the list... ');
      sw.start();
    }
    // print(root);
    var result = Node.getSortedList(root);
    if (takeRunTime) {
      sw.stop();
      stdout.writeln('${sw.elapsedMilliseconds} ms');
    }
    return result;
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
  // ..sortArray2([1,2,3,4,5,6]) // [1,2,3,4,5,6]
  // ..sortArray2([-2,2,3,-2,5,6,-2,5,0,-2,5,7,-2,5]) // [-2,-2,-2,-2,-2,0,2,3,5,5,5,5,6,7]
  // ..sortArray2(arr1)
  ..sortArray2(arr2)
  ;
  // arr2.sort();
  // print(arr2);
}