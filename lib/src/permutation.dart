List<List<T>> getPermutations<T extends Object>(List<T> list) {
  if (list.length > 2) {
    var _result = <List<T>>[];
    for (var i = 0; i < list.length; i++) {
      var _set = list.toList();
      var _e = _set.removeAt(i);
      _result.addAll(getPermutations(_set).map((e) => e..insert(0, _e)));
    }
    return _result;
  }
  if (list.length < 2) return [list];

  return [list, [list[1],list[0]]];
}
