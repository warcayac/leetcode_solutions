// Source: https://leetcode.com/problems/permutations/

List<List<int>> traveler(List<int> list) {
  if (list.length > 2) {
    var _result = <List<int>>[];
    for (var i = 0; i < list.length; i++) {
      var _set = list.toList();
      var _e = _set.removeAt(i);
      _result.addAll(traveler(_set).map((e) => e..insert(0, _e)));
    }
    return _result;
  }
  if (list.length < 2) return [list];

  return [list, [list[1],list[0]]];
}

void getPermutationsWithoutRepetition(List<int> values) {
  if (values.isEmpty || values.length > 6       // violation condition 1
    || values.any((e) => e.abs() > 10)          // violation condition 2
    || values.length != values.toSet().length   // violation condition 3
  ) {
    throw 'Any of the constraints were not satisfied.';
  }
  
  // number of Permutations
  var nP = List.generate(values.length, (i) => i + 1).reduce((e1, e2) => e1 * e2);
  var permutations = traveler(values);

  print(nP == permutations.length);
  print(permutations);
}

void main(List<String> args) {
  getPermutationsWithoutRepetition([1,2,3,4]);
}