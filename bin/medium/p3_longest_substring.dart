// https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution {
  int lengthOfLongestSubstring(String word) {
    if (word.isEmpty) return 0;
    
    var chars = word.split('').toSet().toList();
    final len = word.length;

    if (chars.length == len || chars.length == 1) return chars.length;

    var i = 0;
    var start = 0;
    var result = 0;
    var subset = <String>[];
    
    while (i <= len) {
      if (i == len) {
        if (result < subset.length) result = subset.length;
        break;
      }
      
      var char = word[i];
      
      if (!subset.contains(char)) {
        subset.add(char);
      } else {
        if (result < subset.length) result = subset.length;
        start = word.indexOf(char, start) + 1;
        i = start;
        subset
        ..clear()
        ..add(word[start]);
      }
      
      i++;
    }

    return result;
  }

  void lengthOfLongestSubstring2(String word) {
    print(lengthOfLongestSubstring(word));
  }
}


void main(List<String> args) {
  Solution()
  ..lengthOfLongestSubstring2('abcabcbb')
  ..lengthOfLongestSubstring2('bbbbb')
  ..lengthOfLongestSubstring2('pwwkew')
  ..lengthOfLongestSubstring2('')
  ..lengthOfLongestSubstring2('dvdf')
  ;
}