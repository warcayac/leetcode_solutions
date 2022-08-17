// https://leetcode.com/problems/unique-morse-code-words/
class ViolatedConstraintsException implements Exception {
  @override
  String toString() => 'A constraint has been violated. Check your entries.';
}

class Solution {
  static const morseCodes = ['.-','-...','-.-.','-..','.','..-.','--.','....','..','.---','-.-','.-..','--','-.','---','.--.','--.-','.-.','...','-','..-','...-','.--','-..-','-.--','--..'];

  static final morseTable = <int,String>{}..addEntries(
    [for (var i = 0; i < 26; i++) MapEntry(i + 97, morseCodes[i])]
  );

  int uniqueMorseRepresentations(List<String> words) {
    if (!_constraintsOK(words)) return 0;
    final result = words.map((e) => _convert(e)).toSet();
    return result.length;
  }

  String _convert(String word) {
    return word.codeUnits.map((c) => morseTable[c]).toList().join();
  }

  bool _constraintsOK(List<String> words) {
    var length = words.length;
    final regex = RegExp(r'^[a-z]+$');
    final flag1 = 1 <= length && length <= 100;
    final flag2 = words.every((w) {
      var len = w.length;
      return 1 <= len && len <= 12 && regex.hasMatch(w);
    });
    var result = flag1 && flag2;

    if (!result) throw ViolatedConstraintsException();
    // if (!result) throw Exception('A constraint has been violated. Check your entries.');

    return result;
  }
}

void main(List<String> args) {
  var sol = Solution();
  print(sol.uniqueMorseRepresentations(['gin','zen','gig','msg']));
  print(sol.uniqueMorseRepresentations(['a']));
}