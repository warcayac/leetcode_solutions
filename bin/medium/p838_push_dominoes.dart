class Solution {
  var debugging = true;

  String pushDominoes(String dominoes) {
    if (dominoes.length < 2 || dominoes.split('').toSet().length == 1) return dominoes;

    dominoes = dominoes.replaceAll('.', '?');
    if (debugging) print(dominoes);
    final re2RL = RegExp(r'(?<=R)\?+(?=L)');
    final re2Dot = RegExp(r'(?:(?<=[L\.])\?+(?=[R\.]))|(?:^\?+(?=[R\.]))|(?:(?<=[L\.])\?+$)');
    final re2R = RegExp(r'(?<=R)\?+(?!L)');
    final re2L = RegExp(r'(?<!R)\?+(?=L)');
    
    while (dominoes.contains('?')) {
      dominoes = changeStatesRangeRL(dominoes, re2RL);
      dominoes = changeStatesRange(dominoes, re2Dot, '.');
      dominoes = changeStatesRange(dominoes, re2R, 'R');
      dominoes = changeStatesRange(dominoes, re2L, 'L');
    }

    return dominoes;
  }

  String changeStatesRangeRL(String dominoes, RegExp re) {
    if (debugging) print('\nChanging to... [R-><-L]');
    var result = dominoes.replaceAllMapped(
      re, 
      (match) {
        var chars = match[0]!.split('');
        var len = chars.length;
        var hasCenter = len.isOdd;
        var pivot = (len / 2).floor();

        for (var i = 0; i < len; i++) {
          chars[i] = i < pivot ? 'R' : i == pivot && hasCenter ? '.' : 'L';
        }
        return chars.join();
      }
    );
    if (debugging) print(result);
    return result;
  }

  String changeStatesRange(String dominoes, RegExp re, String newChar) {
    if (debugging) print('\nChanging to... [$newChar]');
    var result = dominoes.replaceAllMapped(re, (match) => newChar * match[0]!.length);
    if (debugging) print(result);
    return result;
  }

  void pushDominoes2(String dominoes) {
    print(pushDominoes(dominoes));
  }
}


void main(List<String> args) {
  Solution()
  // ..pushDominoes2('RR.L')               // RR.L
  // ..pushDominoes2('.L.R...LR..L..')     // LL.RR.LLRRLL..
  // ..pushDominoes2('..')                 // ..
  // ..pushDominoes2('R..L..R..LR.R.R.....') // RRLL..RRLLRRRRRRRRRR
  ..pushDominoes2('R.......L.R.........')  // "RRRR.LLLL.RRRRRRRRRR"
  ;
}