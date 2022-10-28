class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    if (strs.isEmpty || strs.length == 1) return [strs];

    var result = <String, List<String>>{};
    for (var str in strs) {
      var key = sort(str);
      result[key] ??= [];
      result[key]!.add(str);
    }

    return result.values.toList();
  }

  String sort(String str) {
    var list = str.split('')..sort();
    return list.join();
  }

  void groupAnagrams2(List<String> strs) {
    print(groupAnagrams(strs));
  }
}

void main(List<String> args) {
  Solution()
  ..groupAnagrams2(['eat','tea','tan','ate','nat','bat'])
  ..groupAnagrams2([''])
  ..groupAnagrams2(['a'])
  ;
}