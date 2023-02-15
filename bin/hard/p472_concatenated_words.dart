import 'p472_concatenated_words_SAMPLES.dart';


class MyWord {
  final int idx;
  final String word;
  final linkedIdxs = <MyWord>[];
  var isConcatenated = false;
  /* ---------------------------------------------------------------------------- */
  MyWord(this.idx, this.word);
  /* ---------------------------------------------------------------------------- */
  @override
  String toString() {
    return '($idx|${isConcatenated ? 'T' : 'F'}) $word : $linkedIdxs';
    // return word;
  }
}

/* ============================================================================================ */

class Solution {
  var runTimer = true;
  /* ---------------------------------------------------------------------------- */
  List<String> findAllConcatenatedWordsInADict(List<String> words) {
    takeRunningTime(
      runner: () => makeSorting(words), 
      caption: 'Sorting', 
      takeTime: runTimer,
    );

    var wordObjList = List.generate(words.length, (i) => MyWord(i, words[i]));

    takeRunningTime(
      runner: () => makeLinking(words, wordObjList), 
      caption: 'Linking', 
      takeTime: runTimer,
    );
    // wordObjList.forEach(print);

    takeRunningTime(
      runner: () => makeFiltering(wordObjList), 
      caption: 'Filtering', 
      takeTime: runTimer,
    );
    // wordObjList.forEach(print);

    var result = wordObjList.where((o) => o.isConcatenated).map((e) => e.word).toList();
    // var result = <String>[];

    return result;
  }
  /* ---------------------------------------------------------------------------- */
  void makeFiltering(List<MyWord> wordObjList) {
    // si hay palabras que no están compuestas enteramente de al menos dos palabras más cortas,
    // entonces no tiene palabras vinculantes
    wordObjList.forEach((obj) {
      if (obj.linkedIdxs.isEmpty) return;
      hasMatchingWords(obj.word, obj.linkedIdxs)
        ? obj.isConcatenated = true
        : obj.linkedIdxs.clear()
      ;
    });
  }
  /* ---------------------------------------------------------------------------- */
  bool hasMatchingWords(String word, List<MyWord> candidates) {
    if (word.isEmpty) return true;
    var firstChar = word[0];
    var hits = candidates.where((o) => o.word[0] == firstChar);
    if (hits.isEmpty) return false;
    return hits.any((h) {
      if (h.word.length <= word.length && word.substring(0, h.word.length) == h.word) {
        return hasMatchingWords(word.substring(h.word.length), candidates);
      }
      return false;
    });
  }
  /* ---------------------------------------------------------------------------- */
  void makeLinking(List<String> words, List<MyWord> wordObjList) {
    // determinar qué palabras comprenden otras palabras vinculantes más cortas
    for (var i = 0; i < words.length; i++) {
      var pivotWord = words[i];
      if (i < words.length - 1) {
        for (var j = i + 1; j < words.length; j++) {
          var colltedWord = words[j];
          if (colltedWord.length <= pivotWord.length) continue;
          if (colltedWord.contains(pivotWord)) wordObjList[j].linkedIdxs.add(wordObjList[i]);
        }
      }
    }
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
  void takeRunningTime({required void Function() runner, String? caption, bool takeTime = true}) {
    if (!takeTime) {
      runner();
    } else {
      var s = Stopwatch();
      s.start();
      runner();
      s.stop();
      print('==> ${caption ?? 'Time elapsed'}: ${(s.elapsedMilliseconds/1000).toStringAsFixed(2)}s');
    }
  }
  /* ---------------------------------------------------------------------------- */
  void findAllConcatenatedWordsInADict2(List<String> words) {
    var rol = runTimer ? '\n' : '';
    takeRunningTime(
      runner: () => print('$rol${findAllConcatenatedWordsInADict(words)}$rol'),
      takeTime: runTimer,
    );
    print('='*80);
  }
}

void main(List<String> args) {
  // ignore: avoid_single_cascade_in_expression_statements
  Solution()
  // ..findAllConcatenatedWordsInADict2(['cat','cats','catsdogcats','dog','dogcatsdog','hippopotamuses','rat','ratcatdogcat']) // ["catsdogcats","dogcatsdog","ratcatdogcat"]
  // ..findAllConcatenatedWordsInADict2(['cat','dog','catdog'])  // ["catdog"]
  // ..findAllConcatenatedWordsInADict2(['a','b','ab','abc'])  // ['ab']
  // ..findAllConcatenatedWordsInADict2(['a','c','e','k','m','n','p','r','u','w','y','cw','ku','uz','cwkuzyamnerp']) // ["cw","ku","cwkuzyamnerp"]
  // ..findAllConcatenatedWordsInADict2(['at','de','ef','es','re','features','defeature','defeatures']) // ["defeatures"]
  // ..findAllConcatenatedWordsInADict2(longcase1)
  // ..findAllConcatenatedWordsInADict2(longcase2)
  ..findAllConcatenatedWordsInADict2(longcase3)
  ;
}

/* 
Answer for longcase1:
[aa, at, av, ax, bc, br, cr, cw, dc, eo, fd, fg, fq, ge, gu, kk, ku, lq, lt, ly, mf, ng, np, nx, oa, os, po, qa, qe, qm, re, rv, sc, ss, su, ta, tg, tp, ua, vg, vl, wd, wr, ww, ye, yu, yw, yy, cfq, cre, fso, ggk, had, hfl, hwc, hyw, ife, kbu, kmm, kng, lfz, lhv, lmg, lmq, lmu, loc, lqs, lxu, mat, mwo, nkq, pey, qtg, ryp, sid, sox, svo, twn, vep, wsx, ahmv, akdt, bcxw, bilt, coqs, cvet, dtlg, eaum, fecd, fump, gama, gfve, hghv, koat, nxbk, pknt, potn, ppvs, pybf, qfpd, qxru, saeq, tlnc, tmnm, tpvo, tyff, uoay, uwkl, vruh, wcbm, wrxw, xbuw, agylw, apsbu, caybc, cpdxf, dhthp, eyelg, fdnor, ffjfb, gadgt, kdohe, kfykd, khhqr, mqrbq, mumbh, ngzdc, nlwpw, npbep, onlvy, pbdrx, pfgsp, qghoy, rdrls, rfuyp, rlaks, rqdll, rqyex, rwuvd, smkln, soqlh, vhfsf, walsx, wljmg, wnnbq, wqrom, wruqc, xbspa, xdnnl, xhflc, ykbcn, yyhga, armuwp, bwsezd, cymbrl, dmoerc, egdgye, eocfru, htknfa, kqlima, krvnaf, mdtrgv, mwrvel, nhcvpf, nxqmxr, ocedkt, opvrnx, ordxzm, qevdyd, repgcx, rrklkb, tgygdt, ueolqk, ugrloq, vkmxys, vomtuy, vuzygv, wpccoa, xucubv, yxfeoh, adoshnx, aysulvk, bkkxcvg, brdeumb, byyvhgh, ckorgrm, dqhqats, erpbaxq, flhyfac, gtghfxf, hbsfyfv, hrtbfnq, iddymnl, kedhvwy, lehdfnr, llkmagl, mvndmua, myctacn, nberblt, npsoqsw, nxlbkak, ocbbwwd, pbcnmhf, qfzwuwe, qnebmfl, rhymsno, tccvslp, tovdtkr, ubheeqt, udvmara, wlrwyuy, wqqatye, wygsnxk, xbhkkfg, yoifoyg, bxzovyew, cypqodxr, dnrrgmem, dphbfaal, eruffmlg, gbndakaq, gttxwpuk, hdkbdxqg, hnegtuxx, ngrwqpoh, nraoenhd, oncggqvr, pgowefka, pxnktxkm, reqqzzpw, rkbdlchs, rmbxlcmn, suhesetv, syxngevs, tfsrptug, ukmcowoe, wtsbhgkd, wuznnlyd, xwdbycdu, yaqgault, bhhlovgcx, dccamymhp, fctkqlroq, fkyvqguqq, glafbwzdd, gqgsomonv, hyfrdngjf, mtkewbprs, naefganqo, nxtsnason, ogwilaswn, oxpmplpcg, qmmidmvkn, uztnpqhdl, xwnbcuggl, yjyssbsoc, advraqovan, afumtqugec, bhqultkyfq, feclhbvfuk, fkglorkkvx, gsfomhvpmy, hdykehkefp, ilebxwbcto, mabkapuoud, monmwvytby, odknlbvxrs, omwufbdfxu, phouoyhvls, rglnpxfqwu, rlbskqgfvn, rrbhfwohfv, urbrmmadea, uzvgyeette, wtelvsqrru, akyprzzphew, bhopoqdsref, bpeohsufree, bpoaboylced, btgcpqwovwp, eouxbldsxzm, esfmqgvxwfy, fgxnuohrnhg, gcdqbcdwbwa, jmruuqscwjp, kddxywvgqxo, lcblwidhjpu, lfnrhgsxkhx, lfvobeyolyy, nwedtubynsb, puenodlvotb, qcagsyqggcf, sxlngbtxmqr, typttkrpfvx, utqfcqyrrwm, vubuucilxyh, xmywegmtuno, brxpfymuvfvs, cnumquohlcgt, cwkuzyamnerp, dwfcayssyoqc, ebwrcpafxzhb, evxtehxtbthq, exlwulswtvot, fxyfqbeoktcc, goabwrqdoudf, hbuxhwadlpto, hesvnctfvdsp, jfymrbafmyoc, khxkdxflwxme, ngbqqmbxqcqp, paeurdvexqlw, phckcyufdqml, shwywshtdgmb, vfelxvtggkkk, vwduwmjpblqo, xbrtspfttota, cwcchvsasdylb, dfuydrtbfypbn, dhaccuualacyl, dybjywyaodsyw, gmuyytguexnyc, gvyhnchlimsxc, htedgvsrhchox, nvybsfrxtlfmp, oyjmeqvhcrvgm, rlcnvnuuqfvhw, sfzdknoxzassc, svthrfmkoxbho, vqsghhhutdget, vtdxwrclpspcn, wvpfyfpkvgthq, xzluwbtmoxokk, blolplosqnfcwx, eqrswgkaaaohxx, fguvomeepxoffg, gubqavlqffhrzz, khwnykughmwrlk, lucidbnlysamvy, mbntqrlwyampdg, npdbamofynykqv, pwlumocnyuoume, thkglauzgkeuly, ukffmudygjavem, uvouaghhcyvmlk, wfrvxqdkhbwwef, xhnlcrldtfthul, dutnbetocxylcey, goblttgvmndkqgg, lqdqrrcrwdnxeuo, mxlwbkbklbwfsvr, pmxttqftypfexlv, qmqxceuohpiffaq, tdtuquartspkotm, ucgqyvopafyttrh, uxtrdsdfzfssmel, vlrfcsftapyujmw, lplrsxznfkoklxlv, pbqurqfxgqlojmws, phknqtsdtwxcktmw, pstsxhplrrmbeddv, reogbmveofvusdsx, sqqoffmwkplsgbrp, upmsoxftumyxifyu, yqssxzsydgllfzmo]

Answer for longcase2:
[ofay, ohed, omen, omer, omit, ones, onto, onus, opah, opal, oped, open, opes, opus, orad, oral, orby, ordo, ores, osar, oses, alpine, aromas, axeman, axemen, betide, betime, bygone, elided, elides, heishi, hereat, hereby, herein, hereof, hereon, hereto, inaner, inanes, latigo, latino, latish, mopier, mopish, myelin, noesis, nonego, onyxes, orgone, orpine, ostium, ostomy, pelota, sifaka, sonata, tolane, wooded, wooden, armoire, arracks, basemen, mirages, psalmed, senoras, senores, sneered, sneerer, abomasal, abomasum, abomasus, agnomina, albedoes, amoebean, amoeboid, amreetas, anisoles, antinode, antinomy, antiwear, antiweed, appalled, cassises, deadbeat, demeaned, demeanor, exoduses, forehead, frettier, halidome, influxes, isopodan, laagered, loosened, loosener, maestoso, marinade, marquees, mausolea, mesosome, notation, ostomies, pemoline, pieforts, realised, realiser, realises, retinued, retinues, retinula, shutoffs, sideline, unabused, upraised, upraiser, upraises, uprooted, uprooter, woodbine, yeastier, allopaths, allotrope, chordates, headraces, mesopause, reattempt, reconvene, recouping, recursive, rekindled, rekindles, remapping, replaying, reshoeing, retracing, semisweet, showtimes, tricklier, ballerinas, beflowered, copulation, defeatures, delighters, delightful, denotation, depolished, depolishes, deportable, exhalation, formalwear, hermitages, inadequate, microluxes, picarooned, prelimited, reaccredit, reacquired, reacquires, reassigned, rechoosing, remarrying, replanning, resketched, resketches, resummoned, revivified, revivifies, unchurched, unchurches, unchurchly, ungraceful, unneurotic, wilinesses, ailanthuses, allopatries, cocounseled, defloration, inalienable, indivisible, invigilated, invigilates, invigilator, invocations, laundresses, reattempted, unresistant, dreaminesses, fiercenesses, paradisiacal, radiometries, repetitional, storminesses, uniformities, alkalimetries, mindfulnesses, outmaneuvered, surgeonfishes, unquietnesses, desegregations, inviolatenesses, deindustrialized, deindustrializes]

Answer for longcase3:
[greenhorn, greenheads, greenheart, greenstones, oversupplied, oversupplies, soldierships, survivorships]

*/