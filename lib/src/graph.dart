// info: https://www.geeksforgeeks.org/graph-data-structure-and-algorithms/
// info: https://afteracademy.com/blog/introduction-to-graph-in-programming

class Graph {
  final bool isDirected;            // directed graph
  final List<Node> nodes;    // first node is the root
  /* ---------------------------------------------------------------------------- */
  Graph({required this.nodes, this.isDirected = false});
  /* ---------------------------------------------------------------------------- */
  /// **targets** and **data** must have the same length
  /// 
  /// **targets** contains indexes (0<= idx < num_of_nodes) excluding current node
  void addLinks({required int source, required List<int> targets, List<BasicData>? data}) {
    targets = targets.toSet().toList()..remove(source);
    var eval0 = targets.isEmpty;
    var eval1 = targets.length >= nodes.length;
    var eval2 = data != null ? targets.length != data.length : false;
    var eval3 = source < 0 || source >= nodes.length;
    var eval4 = targets.any((idx) => idx < 0 || idx >= nodes.length);
    if (eval0 || eval1 || eval2 || eval3 || eval4) {
      throw 'Some of the links do not meet the necessary requirements.';
    }
    var _links = <Link>[];
    for (var i = 0; i < targets.length; i++) {
      _links.add(Link(
        source: nodes[source], 
        target: nodes[targets[i]],
        data: data != null ? data[i] : null,
        isDirected: isDirected,
      ));
    }

    if (nodes[source].links.isNotEmpty) {
      _links.forEach((e) {
        if (!nodes[source].links.contains(e)) nodes[source].links.add(e);
      });
    } else {
      nodes[source].links.addAll(_links);
    }
  }
  /* ---------------------------------------------------------------------------- */
  List<List<int>> toMatrix() {
    var matrix = List.generate(nodes.length, (_) => List.filled(nodes.length, 0));

    for (var r = 0; r < nodes.length; r++) {
      for (var c = 0; c < nodes.length; c++) {
        if (r == c) continue;
        matrix[r][c] = nodes[r].targets.contains(nodes[c]) ? 1 : 0;
      }
    }

    return matrix;
  }
  /* ---------------------------------------------------------------------------- */
  void _getLongPathsFrom(List<Node> path, List<List<Node>> result) {
    var _start = path.last;
    var _ancestor = path.length > 1 ? path[path.length - 2] : null;
    var _targets = _start.targets.toSet().difference(path.toSet()).toList();

    if (_ancestor != null) _targets.remove(_ancestor);  // avoid an infinite loop
    if (_targets.isNotEmpty) {
      _targets.forEach((n) => _getLongPathsFrom(path.toList()..add(n), result));
    } else {
      // maintain paths of max length/height only
      if (result.isNotEmpty) {
        if (path.length >= result[0].length) {
          path.length == result[0].length
            ? result.add(path)
            : (result..clear()..add(path));
        }
      } else {
        result.add(path);
      }
    }
  }
  /* ---------------------------------------------------------------------------- */
  void findNodesWithMinimumHeightTrees() {
    var _mht = <List<Node>>[];
    for (var i = 0; i < nodes.length; i++) {
      var _result = <List<Node>>[];
      _getLongPathsFrom([nodes[i]], _result);
      if (_mht.isNotEmpty) {
        if (_result[0].length <= _mht[0].length) {
          _result[0].length == _mht[0].length
            ? _mht.addAll(_result)
            : (_mht..clear()..addAll(_result));
        }
      } else {
        _mht.addAll(_result);
      }
    }
    // _mht.forEach((e) {
    //   e.forEach((k) => stdout.write('${k.data.id} '));
    //   print('');
    // });
    print(_mht.map((e) => e[0]).toSet().map((e) => e.data.id));
  }
  /* ---------------------------------------------------------------------------- */
}

class Node {
  final BasicData data;
  final List<Link> links = [];
  /* ---------------------------------------------------------------------------- */
  Node({required this.data});
  /* ---------------------------------------------------------------------------- */
  List<Node> get targets => links.map<Node>((e) => e.target).toList();
  /* ---------------------------------------------------------------------------- */
}

class Link {
  final Node source, target;
  final BasicData? data;
  final bool isDirected;
  /* ---------------------------------------------------------------------------- */
  Link({required this.source, required this.target, this.data, this.isDirected = false}) {
    if (!isDirected && !target.targets.contains(source)) {
      target.links.add(Link(
        source: target, 
        target: source, 
        data: data,
        isDirected: true,     // to avoid an infinite loop
      ));
    }
  }
  /* ---------------------------------------------------------------------------- */
}

class BasicData { 
  final Object id; // int or String
  /* ---------------------------------------------------------------------------- */
  const BasicData(this.id);  
  /* ---------------------------------------------------------------------------- */
}