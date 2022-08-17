class Solution {
  int firstUniqChar(String s) {
    if (!_constraintsOK(s)) return -1;
    var result = <String, int>{};
    for (var i = 0; i < s.length; i++) {
      result[s[i]] = (result[s[i]] ?? 0) + 1;
    }
    var found = result.entries.firstWhere((me) => me.value == 1, orElse: () => MapEntry('',0));
    var index = found.value == 0 ? -1 : s.indexOf(found.key);
    print(index);
    return index;
  }

  bool _constraintsOK(String word) {
    final length = word.length;
    final flag1 = 1 <= length && length <= 10e5;
    final flag2 = RegExp(r'^[a-z]+$').hasMatch(word);
    var result = flag1 && flag2;
    if (!result) throw Exception('A constraint has been violated. Check your entry.');
    return result;
  }
}

void main(List<String> args) {
  Solution()
    ..firstUniqChar('leetcode')
    ..firstUniqChar('loveleetcode')
    ..firstUniqChar('aabb');
}