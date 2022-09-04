class Node {
  static var limit = 0; // longitud del número buscado
  
  final int value;
  Node? previous, next;

  Node(this.value, {this.previous, this.next});

  void getFixedWidthNumbers(List<List<int>> numbers, List<int> candidate, [int width = 0]) {
    candidate.add(value);
    if (++width < limit) {
      previous?.getFixedWidthNumbers(numbers, [...candidate], width);
      next?.getFixedWidthNumbers(numbers, [...candidate], width);
    } else {
      if (candidate.first != 0) numbers.add(candidate);
    }
  }
}

class Solution {
  List<int> numsSameConsecDiff(int n, int k) {
    var results = <int>[];
    var candidates = <List<int>>[];
    if(!_constraintsOK(n, k)) return results;

    if (k > 0) {
      // _solutionByUsingIterations(n, k, candidates);
      _solutionByUsingNodes(n, k, candidates);
    } else {
      candidates.addAll(List.generate(9, (i) => i+1).map((e) => List.filled(n, e)));
    }

    final multiples = <int>[1];
    var base = 10;
    for (var i = 0; i < n-1; i++) {
      multiples.add(base);
      base = base * 10;
    }

    var len = candidates.length;
    for (var i = 0; i < len; i++) {
      var list = candidates[i];
      var sum = 0;
      for (var j = 0; j < n; j++) {
        sum += list[j] * multiples[n-j-1];
      }
      results.add(sum);
    }
    results = results.toSet().toList();
    if (debug) {
      print('*'*20);
      print(results);
    }
    return results;
  }

  /// Esta solución plantea un nuevo enfoque de resolución a diferencia del iterativo
  void _solutionByUsingNodes(int n, int k, List<List<int>> candidates) {
    var upLimit = k < 5 ? k - 1 : 9 - k;
    Node.limit = n;
    for (var start = 0; start <= upLimit; start++) {
      var digits = List.generate((10/k).ceil(), (i) => k*i + start).where((e) => e < 10).toList();
      final nodes = List.generate(digits.length, (i) => Node(digits[i]));
      for (var i = 0; i < nodes.length; i++) {
        if (i != 0) nodes[i].previous = nodes[i-1];
        if (i != nodes.length - 1) nodes[i].next = nodes[i+1];
      }
      nodes.forEach((node) { if (node.value != 0) node.getFixedWidthNumbers(candidates, []); });
    }
  }

  /// Esta solución no es perfecta ya que omite algunos valores ajenos a la lógica planteada
  void _solutionByUsingIterations(int n, int k, List<List<int>> candidates) {
    var upLimit = k < 5 ? k - 1 : 9 - k;
    for (var start = 0; start <= upLimit; start++) {
      var digits = List.generate((10/k).ceil(), (i) => k*i + start).where((e) => e < 10).toList();
      if (debug) {
        print('*'*20);
        print('Digits: $digits');
      }
      for (var size = 2; size <= n; size++) {
        // Crear lista de índices que servirán de referencia para las sublistas que
        // se formarán más adelante, los cuales a su vez generarán los números buscados
        var totalGroups = 2 * (size - 1);
        var relIndexes = <List<int>>[];
        var delta = 0;
        var index = 0;
        var indexes = <int>[];
        var length = digits.length > size ? size : digits.length;
        for (var i = 0; i < 18; i++) {
          indexes.add(index);
          if (index == 0) delta = 1;
          if (index == length - 1) delta = -1;
          index += delta;
        }
        for (var i = 0; i < totalGroups; i++) {
          relIndexes.add(indexes.sublist(i, i + n));
        }
        if (debug) print('relIdxs : $relIndexes ');
        // Vamos a hacer las combinaciones (por cada sublista) según los índices obtenidos antes
        index = 0;
        while (index + size <= digits.length) {
          var group = digits.sublist(index, index + size);
          for (var groupIdx = 0; groupIdx < totalGroups; groupIdx++) {
            var candidate = [for (var r = 0; r < n; r++) group[relIndexes[groupIdx][r]]];
            if (candidate.first != 0) candidates.add(candidate);
          }
          index++;
          if (debug) print('Candidates(idx: $index): $candidates');
        }
      }
    }
  }

  bool _constraintsOK(int n, int k) {
    var flag1 = 2 <= n && n <= 9;
    var flag2 = 0 <= k && k <= 9;
    return flag1 && flag2;
  }
}

var debug = true;

void main(List<String> args) {
  Solution()
  // ..numsSameConsecDiff(3, 7)
  // ..numsSameConsecDiff(2, 1)
  // ..numsSameConsecDiff(2, 0)
  // ..numsSameConsecDiff(3, 1)
  // ..numsSameConsecDiff(2, 2)
  // ..numsSameConsecDiff(4, 0)
  // ..numsSameConsecDiff(4, 1)
  // ..numsSameConsecDiff(2, 3)
  // ..numsSameConsecDiff(5, 1)
  ;
  // var list1 = [10101,10121,10123,12101,12121,12123,12321,12323,12343,12345,21010,21012,21210,21212,21232,21234,23210,23212,23232,23234,23432,23434,23454,23456,32101,32121,32123,32321,32323,32343,32345,34321,34323,34343,34345,34543,34545,34565,34567,43210,43212,43232,43234,43432,43434,43454,43456,45432,45434,45454,45456,45654,45656,45676,45678,54321,54323,54343,54345,54543,54545,54565,54567,56543,56545,56565,56567,56765,56767,56787,56789,65432,65434,65454,65456,65654,65656,65676,65678,67654,67656,67676,67678,67876,67878,67898,76543,76545,76565,76567,76765,76767,76787,76789,78765,78767,78787,78789,78987,78989,87654,87656,87676,87678,87876,87878,87898,89876,89878,89898,98765,98767,98787,98789,98987,98989];
  // var list2 = [10101, 10121, 10123, 12101, 12121, 12123, 12321, 12323, 12343, 12345, 21010, 21012, 21210, 21212, 21232, 21234, 23210, 23212, 23232, 23234, 23432, 23434, 23454, 23456, 32101, 32121, 32123, 32321, 32323, 32343, 32345, 34321, 34323, 34343, 34345, 34543, 34545, 34565, 34567, 43210, 43212, 43232, 43234, 43432, 43434, 43454, 43456, 45432, 45434, 45454, 45456, 45654, 45656, 45676, 45678, 54321, 54323, 54343, 54345, 54543, 54545, 54565, 54567, 56543, 56545, 56565, 56567, 56765, 56767, 56787, 56789, 65432, 65434, 65454, 65456, 65654, 65656, 65676, 65678, 67654, 67656, 67676, 67678, 67876, 67878, 67898, 76543, 76545, 76565, 76567, 76765, 76767, 76787, 76789, 78765, 78767, 78787, 78789, 78987, 78989, 87654, 87656, 87676, 87678, 87876, 87878, 87898, 89876, 89878, 89898, 98765, 98767, 98787, 98789, 98987, 98989];
  // print(list1.toSet().difference(list2.toSet()));
}
