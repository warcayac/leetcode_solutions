class Node {
  static Node? buildNodesList(List<int> values) {
    Node? previous;
    late Node node;
    for (var i = 0; i < values.length; i++) {
      node = Node(values[i]);
      if (previous != null) {
        if (!assignNext(previous, node)) return null;
      }
      node.value != 0 ? previous = node : node = previous!;
    }
    return node;
  }

  static bool assignNext(Node target, Node next) {
    if (next.value == 0) {
      if ([1,2].contains(target.value)) {
        target.value *= 10;
        target.canGroup = false;
        target.weight = 0;
        if (target.previous != null) target.previous!.canGroup = false;
      } else {
        return false;
      }
    } else {
      target.next = next;
      next.previous = target;
      target.canGroup = target.value == 1 || (target.value == 2 && next.value < 7);
    }
    return true;
  }

  int value;
  var weight = 0;
  var canGroup = false;
  final debugging = false;
  Node? previous, next;
  /* ---------------------------------------------------------------------------- */
  Node(this.value);
  /* ---------------------------------------------------------------------------- */
  int traceFromBottom() {
    if (previous == null) {
      if (debugging) print(this);
      return (weight > 0 ? weight : getWeightAsSingle()) + 1;
    }

    if (previous!.canGroup) {
      var weightSingle = getWeightAsSingle();
      var weightTuple = getWeightAsTuple();
      previous!.weight = 1 + weightSingle + weightTuple;
      if (debugging) print('Previous: (${previous!.value}, S:$weightSingle, T:$weightTuple) => W:${previous!.weight}');
    }
    return previous!.traceFromBottom();
  }
  /* ---------------------------------------------------------------------------- */
  int getWeightAsSingle() {
    return weight > 0 
      ? weight 
      : next == null
        ? 0
        : next!.weight > 0 
          ? next!.weight
          : next!.getWeightAsSingle();
  }
  /* ---------------------------------------------------------------------------- */
  int getWeightAsTuple() {
    return next != null ? next!.getWeightAsSingle() : 0;
  }
  /* ---------------------------------------------------------------------------- */
  @override
  String toString() => 
    // '(${previous != null ? previous!.value : '?'},$value,${next != null ? next!.value : '?'})[$counter,$canGroup] ${next != null ? '=> $next' : ''}';
    '$value($weight) ${next != null ? ': $next' : ''}';
}

class Solution {
  int numDecodings(String s) {
    if (s.isEmpty || RegExp(r'^0+|[03-9]0').hasMatch(s)) return 0;

    var tail = Node.buildNodesList(s.split('').map((e) => int.parse(e)).toList());
    if (tail == null) return 0;
    
    return tail.traceFromBottom();
  }

  void numDecodings2(String s) {
    print(numDecodings(s));
  }
}

void main(List<String> args) {
  Solution()
  // ..numDecodings2('111111106')   // 
  // ..numDecodings2('226314106')   // 
  // ..numDecodings2('2162122106')   // 
  // ..numDecodings2('2162122')   // 
  // ..numDecodings2('11106')  // 2
  // ..numDecodings2('111111')  // 13
  // ..numDecodings2('12')   // 2
  // ..numDecodings2('226')  // 3
  // ..numDecodings2('06')   // 0
  // ..numDecodings2('10')   // 1
  // ..numDecodings2('2101')   // 1
  // ..numDecodings2('111111111111111111111111111111111111111111111')  // 1836311903
  ..numDecodings2('1201234')  // 1836311903
  // ..numDecodings2('1'*40)   // 165580141
  ;
}