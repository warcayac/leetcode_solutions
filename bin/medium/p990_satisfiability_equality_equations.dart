class Solution {
  bool equationsPossible(List<String> equations) {
    final re = RegExp(r'^[a-z](?:!|=)=[a-z]$');
    if (equations.isEmpty || !equations.every((eq) => re.hasMatch(eq))) return false;
    if (equations.length == 1) return !isSelfDenied(equations.first);

    var sameVars = <Set<String>>[];
    equations.where((eq) => eq.contains('==')).forEach((e) {
      var xVar = e[0];
      var yVar = e[3];
      if (xVar != yVar) {
        if (sameVars.isNotEmpty) {
          var subset = sameVars.firstWhere((x) => x.contains(xVar) || x.contains(yVar), orElse: () => {});
          if (subset.isEmpty) sameVars.add(subset);
          subset..add(xVar)..add(yVar);
        } else {
          sameVars.add({xVar, yVar});
        }
      }
    });
    // print(sameVars);

    for (var equals in sameVars) {
      var x = equals.first;
      equations = equations.map((eq) {
        var v1 = equals.contains(eq[0]) ? x : eq[0];
        var v2 = equals.contains(eq[3]) ? x : eq[3];

        return v1 + eq[1] + eq[2] + v2;
      }).toSet().toList();
      // print(equations);      
    }

    while (equations.isNotEmpty) {
      var eq = equations.removeLast();
      if (isSelfDenied(eq)) return false;
      if (equations.isEmpty) return true;

      var eqC = eqCounterpart(eq);
      equations.removeWhere((e) => [eq,reverseEq(eq)].contains(e));

      if (equations.contains(eqC) || equations.contains(reverseEq(eqC))) return false;
    }
    
    return true;
  }

  String reverseEq(String eq) => eq[3] + eq[1] + eq[2] + eq[0];

  String eqCounterpart(String eq) {
    var symbol = eq[1] == '=' ? '!' : '=';
    return eq[0] + symbol + eq[2] + eq[3];
  }

  bool isSelfDenied(String eq) => eq[0] == eq[3] && eq[1] == '!';

  void equationsPossible2(List<String> equations) {
    print(equationsPossible(equations));
  }
}

void main(List<String> args) {
  Solution()
  ..equationsPossible2(['a==b','b!=a'])                 // false
  ..equationsPossible2(['b==a','a==b'])                 // true
  ..equationsPossible2(['a==b','b!=c','c==a'])
  ..equationsPossible2(['a!=a'])
  ..equationsPossible2(['e!=c','b!=b','b!=a','e==d'])
  ..equationsPossible2(['d!=d','f==c','e==b','c==a'])
  ..equationsPossible2(['e==e','d!=e','c==d','d!=e'])
  ;
}