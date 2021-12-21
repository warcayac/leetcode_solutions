// https://leetcode.com/problems/longest-substring-without-repeating-characters/


import 'dart:math';

void searchLongestSubString(String word) {
  var subs = <String, int>{};
  var key = <String>[];
  var idx = 0;
  var length = word.length;

  void add2Map(List<String> list) {
    var k = list.join();
    if (!subs.keys.contains(k)) {
      subs[k] = RegExp(k).allMatches(word).length;
    }
    list.clear();
  }

  word.split('').forEach((c) { 
    if (key.contains(c)) add2Map(key);
    key.add(c);
    if (idx + 1 == length) add2Map(key);
    idx++;
  });
  
  var mx = subs.keys.map((e) => e.length).reduce(max);
  print(subs.keys.where((e) => e.length == mx));
}

void main(List<String> args) {
  searchLongestSubString('bbbbb');
  searchLongestSubString('abcabcbb');
  searchLongestSubString('pwwkew');
}