// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'samples_23.dart';
import 'samples_27.dart';
import 'samples_6.dart';
import 'samples_7.dart';


class Solution {
  var uniqueStrings = <String>[];
  var compoundStrings = <String>[];
  var strings  = <String>[];
  var debug = true;
  /* ---------------------------------------------------------------------------- */
  List<String> findAllConcatenatedWordsInADict(List<String> words) {
    if (words.length < 2) return [];

    makeSorting(words);
    var minLength = words.first.length;
    var noSinglesLowerIndex = words.indexWhere((w) => w.length > minLength);

    compoundStrings.clear();
    uniqueStrings = words.take(noSinglesLowerIndex).toList();
    // words.removeRange(0, noSinglesLowerIndex);
    strings = words;

    print(uniqueStrings);
    print(strings);

    for (var i = noSinglesLowerIndex; i < words.length; i++) {
      print(words[i]);
    }

    return [];
  }
  /* ---------------------------------------------------------------------------- */
  void lookIntoString(String word) {
    var candidates = uniqueStrings.where(word.startsWith);
    var expression = candidates.join('|');
    // if (RegExp(source))
  }
  /* ---------------------------------------------------------------------------- */
  void makeSorting(List<String> words) {
    words.sort((a, b) {
      var result = a.length.compareTo(b.length);
      if (result == 0) result = a.compareTo(b);
      return result;
    });
  }
  /* ---------------------------------------------------------------------------- */
  void findAllConcatenatedWordsInADict2(List<String> words) {
    print(findAllConcatenatedWordsInADict(words));
    print('='*80);
  }
}

void main(List<String> args) {
  Solution()
  // ..findAllConcatenatedWordsInADict2(['abc'])
  // ..findAllConcatenatedWordsInADict2(['cat','cats','catsdogcats','dog','dogcatsdog','hippopotamuses','rat','ratcatdogcat']) // ["dogcatsdog","catsdogcats","ratcatdogcat"]
  // ..findAllConcatenatedWordsInADict2(['cat','dog','catdog'])  // ["catdog"]
  // ..findAllConcatenatedWordsInADict2(['a','b','ab','abc'])  // ['ab']
  ..findAllConcatenatedWordsInADict2(['a','c','e','k','m','n','p','r','u','w','y','cw','ku','uz','cwkuzyamnerp']) // ["cw","ku","cwkuzyamnerp"]
  // ..findAllConcatenatedWordsInADict2(['at','de','ef','es','re','features','defeature','defeatures']) // ["defeatures"]
  // ..findAllConcatenatedWordsInADict2(['a','aa','aaa','aaaa','aaaaa','aaaaaa','aaaaaaa','aaaaaaaa','aaaaaaaaa','aaaaaaaaaa','aaaaaaaaaaa','aaaaaaaaaaaa','aaaaaaaaaaaaa','aaaaaaaaaaaaaa','aaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaz'])
  // ..findAllConcatenatedWordsInADict2(longcase1)
  // ..findAllConcatenatedWordsInADict2(longcase2)
  // ..findAllConcatenatedWordsInADict2(longcase3)
  // ..findAllConcatenatedWordsInADict2(longcase4)
  // ..findAllConcatenatedWordsInADict2(longcase5)
  // ..findAllConcatenatedWordsInADict2(longcase6)
  // ..findAllConcatenatedWordsInADict2(longcase7)
  // ..findAllConcatenatedWordsInADict2(longcase23)
  // ..findAllConcatenatedWordsInADict2(longcase27)
  ;
  print('\nJob done!');
}
