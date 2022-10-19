class Solution {
  static final cache = <int, String>{1:'1'};
  static final separator = RegExp(r'(?<=(\d))(?!\1)');

  String countAndSay(int n) {
    if (n < 1 || n > 30) return '';
    if (cache[n] != null) return cache[n]!;
    var value = countAndSay(n-1);
    var list = value.split(separator);
    var result = list.map((e) => '${e.length}${e[0]}').join();
    cache[n] = result;
    return result;
  }

  void countAndSay2(int n) {
    print(countAndSay(n));
  }
}

void main(List<String> args) {
  Solution()
  ..countAndSay2(1)
  ..countAndSay2(4)
  ;
}