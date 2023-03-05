import 'dart:io';

import 'sample_1.dart';
import 'sample_2.dart';

// Source: https://leetcode.com/problems/sort-an-array/solutions/3244102/super-mega-dart-merge-sort-solution-beat-100-wow/?languageTags=dart
class Solution {
  List<int> sortArray(List<int> nums) {
    final res = List.of(nums);

    if (nums.length == 1) {
        return res;
    }

    final middle = nums.length ~/ 2;
    final left = sortArray(nums.sublist(0, middle));
    final right = sortArray(nums.sublist(middle));

    var lIndex = 0;
    var rIndex = 0;
    for (int i = 0; i < res.length; i++) {
      if (rIndex == right.length || lIndex < left.length && left[lIndex] < right[rIndex]) {
        res[i] = left[lIndex++];
      }
      else {
        res[i] = right[rIndex++];
      }
    }
    
    return res;          
  }
  /* ---------------------------------------------------------------------------- */
  void sortArray2(List<int> nums) {
    var sw = Stopwatch();
    stdout.write('Sorting... ');
    sw.start();
    var result = sortArray(nums);
    sw.stop();
    stdout.writeln('${sw.elapsedMilliseconds} ms');
    print(result);
    print('='*80);
  }
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
}