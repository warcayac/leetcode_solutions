List<T> tuple<T extends Object>(T a, T b) => List.from([a,b], growable: false);

List<int> interval(int a, int b) {
  if (a > b) throw 'Lower bound must not be greater than upper bound.';
  return tuple<int>(a, b);
}
