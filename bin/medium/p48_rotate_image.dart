class Solution {
  void rotate(List<List<int>> matrix) {
    _checkConstraints(matrix);
    
    final dimension = matrix.length;
    final size = dimension - 1;
    final middle = (size / 2).truncate();
    if (size < 1) return;

    void swapper(int r, int c) {
      if (r == c && c == size - r) return;
      var tmp = matrix[r][c];
      matrix[r][c] = matrix[size - c][r];
      matrix[size - c][r] = matrix[size - r][size - c];
      matrix[size - r][size - c] = matrix[c][size - r];
      matrix[c][size - r] = tmp;
    }

    print('Input: $matrix');
    if (middle > 0) {
      for (var iter = 0; iter < middle; iter++) {
        for (var i = iter; i < size - iter; i++) {
          swapper(iter, i);
        }
      }
    }
    swapper(middle, middle);
    print('Output: $matrix\n');
  }

  void _checkConstraints(List<List<int>> input) {
    final length = input.length;
    final flags = List.filled(3, false);
    flags[0] = 1 <= length && length <= 20;
    flags[1] = input.every((e) => e.length == length);
    flags[2] = input.every((r) => r.every((c) => -1000 <= c && c <= 1000));
    var result = flags.every((e) => e);
    if (!result) throw Exception('A constraint has been violated. Check your input.');
  }
}

void main(List<String> args) {
  Solution()
  ..rotate([[1]])
  ..rotate([[1,2],[3,4]]) // [[3,1],[4,2]]
  ..rotate([[1,2,3],[4,5,6],[7,8,9]]) // [[7,4,1],[8,5,2],[9,6,3]]
  ..rotate([[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]])
  // [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
  ..rotate([[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]])
  // [[21,16,11,6,1],[22,17,12,7,2],[23,18,13,8,3],[24,19,14,9,4],[25,20,15,10,5]]
  ;
}