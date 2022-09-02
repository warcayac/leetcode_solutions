class Solution {
  bool isMatch(String s, String p) {
    var result = RegExp(r'^'+p+r'$').hasMatch(s);
    print(result);
    return result;
  }
}

void main(List<String> args) {
  Solution()
  ..isMatch('aa', 'a')
  ..isMatch('aa', 'a*')
  ..isMatch('ab', '.*')
  ;
}