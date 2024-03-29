List<T> tuple<T extends Object>(T a, T b) => List.from([a,b], growable: false);

List<int> interval(int a, int b) {
  if (a > b) throw 'Lower bound must not be greater than upper bound.';
  return tuple<int>(a, b);
}

bool isSigned32bitInteger(int n) {
  const kLowerLimit = -2147483648; // -2^31 = 0xFFFFFFFF80000000
  const kUpperLimit = 2147483647;  // 2^31 - 1 = 0x7FFFFFFF
  return kLowerLimit <= n && n <= kUpperLimit;
}