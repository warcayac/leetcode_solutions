import 'dart:math';

typedef MeLcI = MapEntry<List<Cell>, int>;


class Board {
  late final Point size;
  late final List<List<Cell>> cells;
  late Cell _start1, _start2;
  /* ---------------------------------------------------------------------------- */
  Board(List<List<int>> data) {
    size = Point(data[0].length, data.length); // x : cols, y : rows
    cells = List.generate(
      rows, 
      (r) => List.generate(
        cols, 
        (c) => Cell(this, Point(c,r), data[r][c])
      )
    );
    _start1 = cell(0, 0)!..makeLinks();
    _start2 = cell(0, cols - 1)!..makeLinks();
  }
  /* ---------------------------------------------------------------------------- */
  int get rows => size.y.toInt();
  int get cols => size.x.toInt();
  Cell? cell(int row, int col) {
    return 0 <= row && row < rows && 0 <= col && col < cols
      ? cells[row][col]
      : null;
  }
  /* ---------------------------------------------------------------------------- */
  void _findPaths(Cell? nextCell, List<Cell> currentPath, Map<List<Cell>,int> paths) {
    if (nextCell != null) {
      currentPath.add(nextCell);
      if (nextCell.nextL == null && nextCell.next == null && nextCell.nextR == null) {
        paths[currentPath] = currentPath.map((e) => e.cherries).reduce((v, e) => v + e);
      } else {
        _findPaths(nextCell.nextL, currentPath.toList(), paths);
        _findPaths(nextCell.next, currentPath.toList(), paths);
        _findPaths(nextCell.nextR, currentPath.toList(), paths);
      }
    } else {
      if (currentPath.length == rows ) {
        paths[currentPath] = currentPath.map((e) => e.cherries).reduce((v, e) => v + e);
      }
    }
  }
  /* ---------------------------------------------------------------------------- */
  void collectCherries() {
    var paths1 = <List<Cell>,int>{};
    var paths2 = <List<Cell>,int>{};

    _findPaths(_start1, <Cell>[], paths1);
    _findPaths(_start2, <Cell>[], paths2);

    var p1L = paths1.entries.toList()..sort((a,b) => b.value.compareTo(a.value));
    var p2L = paths2.entries.toList()..sort((a,b) => b.value.compareTo(a.value));
    var result = <int, Map<MeLcI, Iterable<MeLcI>>>{};

    for (var me1 in p1L) {
      var subp2L = p2L.where((me2) => me2.key.toSet().intersection(me1.key.toSet()).isEmpty);
      var vmax = subp2L.map((me) => me.value).reduce(max);
      subp2L = subp2L.where((me) => me.value == vmax);
      var total = me1.value + vmax;

      if (result.isEmpty) {
        result[total] = {me1: subp2L};
      } else {
        var _me = result.entries.first;
        if (total > _me.key) {
          result.clear();
          result[total] = {me1: subp2L};
        }
        if (total == _me.key) {
          result[total]!.addAll({me1: subp2L});
        }
      }
    }

    result.forEach((k1, v1) {
      print('Cherries : $k1');
      v1.forEach((k2, v2) {
        print("  Bot1's path:");
        print('    ${k2.key} => ${k2.value}');
        print("  Bot2's paths:");
        v2.forEach((me) => print('    ${me.key} => ${me.value}'));
      });
    });
  }
}

class Cell {
  final Board owner;
  final Point rc;
  final int cherries;
  Cell? nextL, next, nextR;
  /* ---------------------------------------------------------------------------- */
  Cell(this.owner, this.rc, this.cherries);
  /* ---------------------------------------------------------------------------- */
  int get row => rc.y.toInt();
  int get col => rc.x.toInt();
  /* ---------------------------------------------------------------------------- */
  void makeLinks() {
    nextL = owner.cell(row + 1, col - 1);
    next  = owner.cell(row + 1, col);
    nextR = owner.cell(row + 1, col + 1);
    if (nextL != null) nextL!.makeLinks();
    if (next != null) next!.makeLinks();
    if (nextR != null) nextR!.makeLinks();
  }
  /* ---------------------------------------------------------------------------- */
  @override
  String toString() {
    return '($row,$col)';
  }
}

List<List<int>> validate(List<List<int>> data) {
  var rows = data.length;
  var cols = data[0].length;
  var flag1 = data.every((r) => r.length == cols);
  var flag2 = 2 <= rows && rows <= 70;
  var flag3 = 2 <= cols && cols <= 70;
  var flag4 = data.every((r) => r.every((c) => 0 <= c && c <= 100));

  if (!(flag1 && flag2 && flag3 && flag4)) throw 'Constraint violation.';
  return data;
}

void main(List<String> args) {
  Board(validate([[3,1,1],[2,5,1],[1,5,5],[2,1,1]]))
    .collectCherries();
  print('='*50);
  Board(validate([[1,0,0,0,0,0,1],[2,0,0,0,0,3,0],[2,0,9,0,0,0,0],[0,3,0,5,4,0,0],[1,0,2,3,0,0,6]]))
    .collectCherries();
  print('\nDone!');
}