// La permutación puede hacerse tomando todo el conjunto o un sub-conjunto
// En el caso de tomar todo el conjunto, debe considerarse el caso de elementos
// repetitivos, en cuyo caso la fórmula a aplicar sería:
// Permutaciones = N! / (n1! n2! ... ni!)
// donde: 
//  - "N" total de elementos del conjunto
//  - "ni" indica el número de repeticiones de un elemento
//  - {n1,n2,...,ni} : subconjunto de elementos únicos
// Si todos los elementos fuesen distintos, entonces la fórmula sería: P = N!
// Permutations (P) are to be formed using k of the objects at a time, the number of 
// different permutations possible is denoted by the symbol P(n,k). Formula:
// P(n,k) = n! / (n-k)!

// Esta función asume que todos los elementos son distintos
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
