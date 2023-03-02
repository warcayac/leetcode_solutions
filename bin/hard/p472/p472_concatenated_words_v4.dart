// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'samples_23.dart';
import 'samples_27.dart';
import 'samples_6.dart';
import 'samples_7.dart';


class Solution {
  var minLength = 0;
  var noSinglesLowerIndex = 0;
  var wordList = <String>[];
  var results = <String>[];
  var uniques = '';
  var debug = true;
  /* ---------------------------------------------------------------------------- */
  List<String> findAllConcatenatedWordsInADict(List<String> words) {
    if (words.length < 2) return [];
    
    makeSorting(words);
    final length = words.length;
    minLength = words.first.length;
    noSinglesLowerIndex = words.indexWhere((w) => w.length > minLength);
    wordList = words;
    uniques = words.getRange(0, noSinglesLowerIndex).join('|');

    // if (debug) print(wordList);
    results.clear();
    for (var i = noSinglesLowerIndex; i < length; i++) {
      if (isCompoundStr(wordList[i])) results.add(wordList[i]);
      if (debug) {
        print('  ==> $results');
        print('*'*50);
      }
    }

    return results;
  }
  /* ---------------------------------------------------------------------------- */
  bool isCompoundStr(String base, [String? subPart]) {
    if (debug) print('($base,$subPart)');
    if (subPart != null) {
      if (subPart.isEmpty || results.contains(subPart)) return true;
      if (subPart.length < minLength) return false;
      if (subPart.length == minLength) {
        return wordList.getRange(0, noSinglesLowerIndex).contains(subPart);
      }
    }

    var target = subPart ?? base;
    var length = target.length;
    var candidates = <String>[];
    for (var word in wordList) {
      if (word.length > length || (base == target && word == target)) break;
      if (target.startsWith(word)) candidates.add(word);
    }
    if (candidates.isEmpty) return false;
    var start = candidates.first;
    candidates = candidates
      .map((e) => RegExp('^(?:$start)*($start(?!$start).*)').firstMatch(e)![1]!)
      .toSet()
      .toList()
    ;

    if (debug) print('  Candidates: $candidates');
    if (candidates.isEmpty) return false;

    return candidates.any((e) => isCompoundStr(base, target.substring(e.length)));
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
  // ..findAllConcatenatedWordsInADict2(['a','c','e','k','m','n','p','r','u','w','y','cw','ku','uz','cwkuzyamnerp']) // ["cw","ku","cwkuzyamnerp"]
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
  ..findAllConcatenatedWordsInADict2(longcase27)
  ;
  print('\nJob done!');
}
