// https://leetcode.com/problems/merge-intervals/
import 'package:leetcode/src/utils.dart';


List<int> getNewInterval(List<int> ab, List<int> xy) {
  var list = [...ab,...xy]..sort()..toSet()..toList();
  var result = [list.first, list.last];

  if (list.length == 4) {
    return list.first == ab.first && list.last == xy.last
      ? (xy.first > ab.last ? [] : result)
      : list.first == xy.first && list.last == ab.last
        ? (ab.first > xy.last ? [] : result)
        : result;
  }
  return result;
}

void mergeIntervals(List<List<int>> intervals, List<List<int>> result) {
  var _base = intervals.removeAt(0);
  var _merged = <List<int>>[];
  if (intervals.isEmpty) {
    result.add(_base);
    return;
  }
  
  for (var ab in intervals) {
    var x = getNewInterval(_base, ab);
    if (x.isNotEmpty) {
      _base = x;
      _merged.add(ab);
    }
  }

  result.add(_base);
  if (_merged.isNotEmpty) {
    _merged
      ..forEach((e) => intervals.remove(e))
      ..clear();
  }

  if (intervals.isNotEmpty) mergeIntervals(intervals, result);
}

void main(List<String> args) {
  var result = <List<int>>[];
  mergeIntervals(
    [
      // interval(1, 3), 
      // interval(2, 6),
      // interval(8, 10),
      // interval(15, 18),
      interval(1, 4),
      interval(4, 5),
    ],
    result,
  );
  print(result);
}