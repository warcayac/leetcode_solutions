// https://leetcode.com/problems/longest-palindromic-substring/

extension on String {
  String reverse() => split('').reversed.join();
}

void searchPalindromicString(String word, [int? size]) {
  size ??= word.length;

  if (size > 0) {
    var groups = <String>[];
    for (var i = 0; i < word.length - size + 1; i++) {
      var s1 = word.substring(i, i + size);
      if (s1 == s1.reverse()) groups.add(s1);
    }
    groups.isEmpty ? searchPalindromicString(word, --size) : print(groups);
  } else {
    print('[]');
  }
}

String validateInput(String input) {
  if (!RegExp(r'^[\d\w]{1,1000}$').hasMatch(input)) throw 'Constraint failed.';
  return input;
}

void main(List<String> args) {
  searchPalindromicString(validateInput('babad'));
  searchPalindromicString(validateInput('cbbd'));
  print('\nDone!');
}