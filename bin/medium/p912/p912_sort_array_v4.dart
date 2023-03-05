// helper function
import 'dart:io';

import 'sample_1.dart';
import 'sample_2.dart';

// Algorithm implemented from "Data Structures  Algorithms in Dart (Sande, 2022)" book
List<E> _merge<E extends Comparable<dynamic>>(List<E> listA, List<E> listB) {
  var indexA = 0;
  var indexB = 0;
  final result = <E>[];

  while (indexA < listA.length && indexB < listB.length) {
    final valueA = listA[indexA];
    final valueB = listB[indexB];

    var comparer = valueA.compareTo(valueB);
    if (comparer < 0) {
      result.add(valueA);
      indexA++;
    } 
    if (comparer > 0) {
      result.add(valueB);
      indexB++;
    }
    if (comparer == 0) {
      result.add(valueA);
      result.add(valueB);
      indexA++;
      indexB++;
    }
  }

  if (indexA < listA.length) {
    result.addAll(listA.getRange(indexA, listA.length));
  }
  if (indexB < listB.length) {
    result.addAll(listB.getRange(indexB, listB.length));
  }

  return result;
}

List<E> mergeSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) return list;

  final middle = list.length ~/ 2;
  final left = mergeSort(list.sublist(0, middle));
  final right = mergeSort(list.sublist(middle));

  return _merge(left, right);
}

class Solution {
  var takeRunTime = true;
  /* ---------------------------------------------------------------------------- */
  List<int> sortArray(List<int> nums) {
    var sw = Stopwatch();
    if (takeRunTime) {
      stdout.write('Sorting... ');
      sw.start();
    }
    var result = mergeSort<int>(nums);
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
}