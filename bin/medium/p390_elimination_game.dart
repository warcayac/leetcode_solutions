import 'dart:math';

class Solution {
  var debug = false;
  /* ---------------------------------------------------------------------------- */
  int lastRemaining(int n) {
    if (n == 1) return 1;

    return 2 * applyElimination(n ~/ 2);
  }
  /* ---------------------------------------------------------------------------- */
  int applyElimination(int m, [int iter = 0, int priorHead = 1, int priorTail = 0, bool reverse = false]) {
    if (priorHead == priorTail) return priorHead;

    late int curHead, curTail;

    if (iter == 0) {
      curHead = 1;
      curTail = m;
    } else {
      var priorFactor = pow(2, iter-1).toInt();
      var curFactor = pow(2, iter).toInt();
      if (reverse) {
        curTail = priorTail - priorFactor;
        curHead = curTail - curFactor * (m-1);
      } else {
        curHead = priorHead + priorFactor;
        curTail = curHead + curFactor * (m-1);
      }
    }

    if (debug) print('iter: $iter -> m: $m ${reverse ? '<-' : '->'} ($curHead, $curTail)');
    return applyElimination(m ~/ 2, ++iter, curHead, curTail, !reverse);
  }
  /* ---------------------------------------------------------------------------- */
  void lastRemaining2(int n) {
    print('==> n: $n -> ${lastRemaining(n)}');
    print('='*80);
  }
}

void main(List<String> args) {
  var sol = Solution();
  Iterable.generate(100, (i) => 2*i + 3).forEach(sol.lastRemaining2);
  // sol.lastRemaining2(201);
  // sol.lastRemaining2(99);
  // sol.lastRemaining2(61);
  // sol.lastRemaining2(59);
  // sol.lastRemaining2(9);
  // sol.lastRemaining2(7);
  // sol.lastRemaining2(5);
  // sol.lastRemaining2(3);
}