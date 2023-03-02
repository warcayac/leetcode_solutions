class Solution {
  /* ---------------------------------------------------------------------------- */
  int compress(List<String> chars) {
    var groups = RegExp(r'((.)\2*)')
      .allMatches(chars.join())
      .map((m) {
        var str = m[0]!;
        var result = [str[0]];
        if (str.length > 1) result.addAll(str.length.toString().split(''));
        return result;
      })
    ;
    chars.clear();
    groups.forEach(chars.addAll);
    print(chars);
    return chars.length;
  }
  /* ---------------------------------------------------------------------------- */
  void compress2(List<String> chars) {
    print(compress(chars));
    print('='*80);
  }
}

void main(List<String> args) {
  Solution()
    ..compress2(['a','a','b','b','c','c','c'])  // 6 , ["a","2","b","2","c","3"]
    ..compress2(['a'])  // 1 , ["a"]
    ..compress2(['a','b','b','b','b','b','b','b','b','b','b','b','b'])  // 4 , ["a","b","1","2"]
    ..compress2(['a','a','a','b','b','a','a'])  // 6 , ["a","3","b","2","a","2"]
  ;
  print('\nJob done!');
}