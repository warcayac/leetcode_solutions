class Solution {
  List<String> topKFrequent(List<String> words, int k) {
    var dic = <String, int>{};
    words.forEach((word) => dic[word] = (dic[word] ?? 0) + 1);
    var sorted = dic.entries.toList()..sort((a, b) {
      return a.value != b.value 
        ? b.value.compareTo(a.value)
        : a.key.compareTo(b.key);
    });
    return sorted.take(k).map((me) => me.key).toList();
  }

  void topKFrequent2(List<String> words, int k) {
    print(topKFrequent(words, k));
  }
}

void main(List<String> args) {
  Solution()
  ..topKFrequent2(['i','love','leetcode','i','love','coding'], 2)
  ..topKFrequent2(['the','day','is','sunny','the','the','the','sunny','is','is'], 4)
  ;
}