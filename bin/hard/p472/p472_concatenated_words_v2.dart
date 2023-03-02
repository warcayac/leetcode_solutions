// ignore_for_file: avoid_single_cascade_in_expression_statements, unused_import

import 'dart:collection';
import 'dart:io';

import 'samples_1.dart';
import 'samples_4.dart';
import 'samples_5.dart';


// explanation: https://www.youtube.com/watch?v=N_5UC8tV1bI
class Solution {
  var vocab = <String>{};
  var debug = false;
  var counter = 0;
  /* ---------------------------------------------------------------------------- */
  List<String> findAllConcatenatedWordsInADict(List<String> words) {
    makeSorting(words);
    vocab = Set.unmodifiable(words);
    var result = <String>[];

    words.forEach((word) {
      debug = word == words.last;
      if (dfs(word) && !result.contains(word)) result.add(word);
    });

    return result;
  }
  /* ---------------------------------------------------------------------------- */
  bool dfs(String word, [int iter = 0]) {
    // if (debug && counter > 100) return false;
    if (debug) {
      print('>>> Word "$word" with loop $iter');
      counter++;
    }

    for (var i = 1; i < word.length; i++) {
      var prefix = word.substring(0, i);
      if (debug) stdout.write('Loop: $iter ==> i: $i => prefix: $prefix');
      if (vocab.contains(prefix)) {
        var suffix = word.substring(i);
        if (debug) stdout.writeln(' => suffix: $suffix');
        if (vocab.contains(suffix) || dfs(suffix, iter + 1)) return true;
      } else {
        if (debug) stdout.writeln();
      }
    }
    return false;
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
  // ..findAllConcatenatedWordsInADict2(['cat','cats','catsdogcats','dog','dogcatsdog','hippopotamuses','rat','ratcatdogcat']) // ["catsdogcats","dogcatsdog","ratcatdogcat"]
  // ..findAllConcatenatedWordsInADict2(['cat','dog','catdog'])  // ["catdog"]
  // ..findAllConcatenatedWordsInADict2(['a','b','ab','abc'])  // ['ab']
  // ..findAllConcatenatedWordsInADict2(['a','c','e','k','m','n','p','r','u','w','y','cw','ku','uz','cwkuzyamnerp']) // ["cw","ku","cwkuzyamnerp"]
  // ..findAllConcatenatedWordsInADict2(['at','de','ef','es','re','features','defeature','defeatures']) // ["defeatures"]
  // ..findAllConcatenatedWordsInADict2(longcase1)
  // ..findAllConcatenatedWordsInADict2(longcase2)
  // ..findAllConcatenatedWordsInADict2(longcase3)
  // ..findAllConcatenatedWordsInADict2(longcase4)
  // ..findAllConcatenatedWordsInADict2(longcase5)
  // ..findAllConcatenatedWordsInADict2(['a','aa','aaa','aaaa','aaaaa','aaaaaa','aaaaaaa','aaaaaaaa','aaaaaaaaa','aaaaaaaaaa','aaaaaaaaaaa','aaaaaaaaaaaa','aaaaaaaaaaaaa','aaaaaaaaaaaaaa','aaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaz'])
  ..findAllConcatenatedWordsInADict2(['a','aa','aaa','aaaa','aaaaa','aaaaaa','aaaaaaa','aaaaaaaa','aaaaaaaaa','aaaaaaaaaa','aaaaaaaaaaa','aaaaaaaaaaaa','aaaaaaaaaaaaa','aaaaaaaaaaaaaa','aaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaz'])
  ;
  print('\nJob done!');
}

/* 
Answer for longcase1:
[aa, at, av, ax, bc, br, cr, cw, dc, eo, fd, fg, fq, ge, gu, kk, ku, lq, lt, ly, mf, ng, np, nx, oa, os, po, qa, qe, qm, re, rv, sc, ss, su, ta, tg, tp, ua, vg, vl, wd, wr, ww, ye, yu, yw, yy, cfq, cre, fso, ggk, had, hfl, hwc, hyw, ife, kbu, kmm, kng, lfz, lhv, lmg, lmq, lmu, loc, lqs, lxu, mat, mwo, nkq, pey, qtg, ryp, sid, sox, svo, twn, vep, wsx, ahmv, akdt, bcxw, bilt, coqs, cvet, dtlg, eaum, fecd, fump, gama, gfve, hghv, koat, nxbk, pknt, potn, ppvs, pybf, qfpd, qxru, saeq, tlnc, tmnm, tpvo, tyff, uoay, uwkl, vruh, wcbm, wrxw, xbuw, agylw, apsbu, caybc, cpdxf, dhthp, eyelg, fdnor, ffjfb, gadgt, kdohe, kfykd, khhqr, mqrbq, mumbh, ngzdc, nlwpw, npbep, onlvy, pbdrx, pfgsp, qghoy, rdrls, rfuyp, rlaks, rqdll, rqyex, rwuvd, smkln, soqlh, vhfsf, walsx, wljmg, wnnbq, wqrom, wruqc, xbspa, xdnnl, xhflc, ykbcn, yyhga, armuwp, bwsezd, cymbrl, dmoerc, egdgye, eocfru, htknfa, kqlima, krvnaf, mdtrgv, mwrvel, nhcvpf, nxqmxr, ocedkt, opvrnx, ordxzm, qevdyd, repgcx, rrklkb, tgygdt, ueolqk, ugrloq, vkmxys, vomtuy, vuzygv, wpccoa, xucubv, yxfeoh, adoshnx, aysulvk, bkkxcvg, brdeumb, byyvhgh, ckorgrm, dqhqats, erpbaxq, flhyfac, gtghfxf, hbsfyfv, hrtbfnq, iddymnl, kedhvwy, lehdfnr, llkmagl, mvndmua, myctacn, nberblt, npsoqsw, nxlbkak, ocbbwwd, pbcnmhf, qfzwuwe, qnebmfl, rhymsno, tccvslp, tovdtkr, ubheeqt, udvmara, wlrwyuy, wqqatye, wygsnxk, xbhkkfg, yoifoyg, bxzovyew, cypqodxr, dnrrgmem, dphbfaal, eruffmlg, gbndakaq, gttxwpuk, hdkbdxqg, hnegtuxx, ngrwqpoh, nraoenhd, oncggqvr, pgowefka, pxnktxkm, reqqzzpw, rkbdlchs, rmbxlcmn, suhesetv, syxngevs, tfsrptug, ukmcowoe, wtsbhgkd, wuznnlyd, xwdbycdu, yaqgault, bhhlovgcx, dccamymhp, fctkqlroq, fkyvqguqq, glafbwzdd, gqgsomonv, hyfrdngjf, mtkewbprs, naefganqo, nxtsnason, ogwilaswn, oxpmplpcg, qmmidmvkn, uztnpqhdl, xwnbcuggl, yjyssbsoc, advraqovan, afumtqugec, bhqultkyfq, feclhbvfuk, fkglorkkvx, gsfomhvpmy, hdykehkefp, ilebxwbcto, mabkapuoud, monmwvytby, odknlbvxrs, omwufbdfxu, phouoyhvls, rglnpxfqwu, rlbskqgfvn, rrbhfwohfv, urbrmmadea, uzvgyeette, wtelvsqrru, akyprzzphew, bhopoqdsref, bpeohsufree, bpoaboylced, btgcpqwovwp, eouxbldsxzm, esfmqgvxwfy, fgxnuohrnhg, gcdqbcdwbwa, jmruuqscwjp, kddxywvgqxo, lcblwidhjpu, lfnrhgsxkhx, lfvobeyolyy, nwedtubynsb, puenodlvotb, qcagsyqggcf, sxlngbtxmqr, typttkrpfvx, utqfcqyrrwm, vubuucilxyh, xmywegmtuno, brxpfymuvfvs, cnumquohlcgt, cwkuzyamnerp, dwfcayssyoqc, ebwrcpafxzhb, evxtehxtbthq, exlwulswtvot, fxyfqbeoktcc, goabwrqdoudf, hbuxhwadlpto, hesvnctfvdsp, jfymrbafmyoc, khxkdxflwxme, ngbqqmbxqcqp, paeurdvexqlw, phckcyufdqml, shwywshtdgmb, vfelxvtggkkk, vwduwmjpblqo, xbrtspfttota, cwcchvsasdylb, dfuydrtbfypbn, dhaccuualacyl, dybjywyaodsyw, gmuyytguexnyc, gvyhnchlimsxc, htedgvsrhchox, nvybsfrxtlfmp, oyjmeqvhcrvgm, rlcnvnuuqfvhw, sfzdknoxzassc, svthrfmkoxbho, vqsghhhutdget, vtdxwrclpspcn, wvpfyfpkvgthq, xzluwbtmoxokk, blolplosqnfcwx, eqrswgkaaaohxx, fguvomeepxoffg, gubqavlqffhrzz, khwnykughmwrlk, lucidbnlysamvy, mbntqrlwyampdg, npdbamofynykqv, pwlumocnyuoume, thkglauzgkeuly, ukffmudygjavem, uvouaghhcyvmlk, wfrvxqdkhbwwef, xhnlcrldtfthul, dutnbetocxylcey, goblttgvmndkqgg, lqdqrrcrwdnxeuo, mxlwbkbklbwfsvr, pmxttqftypfexlv, qmqxceuohpiffaq, tdtuquartspkotm, ucgqyvopafyttrh, uxtrdsdfzfssmel, vlrfcsftapyujmw, lplrsxznfkoklxlv, pbqurqfxgqlojmws, phknqtsdtwxcktmw, pstsxhplrrmbeddv, reogbmveofvusdsx, sqqoffmwkplsgbrp, upmsoxftumyxifyu, yqssxzsydgllfzmo]

Answer for longcase2:
[ofay, ohed, omen, omer, omit, ones, onto, onus, opah, opal, oped, open, opes, opus, orad, oral, orby, ordo, ores, osar, oses, alpine, aromas, axeman, axemen, betide, betime, bygone, elided, elides, heishi, hereat, hereby, herein, hereof, hereon, hereto, inaner, inanes, latigo, latino, latish, mopier, mopish, myelin, noesis, nonego, onyxes, orgone, orpine, ostium, ostomy, pelota, sifaka, sonata, tolane, wooded, wooden, armoire, arracks, basemen, mirages, psalmed, senoras, senores, sneered, sneerer, abomasal, abomasum, abomasus, agnomina, albedoes, amoebean, amoeboid, amreetas, anisoles, antinode, antinomy, antiwear, antiweed, appalled, cassises, deadbeat, demeaned, demeanor, exoduses, forehead, frettier, halidome, influxes, isopodan, laagered, loosened, loosener, maestoso, marinade, marquees, mausolea, mesosome, notation, ostomies, pemoline, pieforts, realised, realiser, realises, retinued, retinues, retinula, shutoffs, sideline, unabused, upraised, upraiser, upraises, uprooted, uprooter, woodbine, yeastier, allopaths, allotrope, chordates, headraces, mesopause, reattempt, reconvene, recouping, recursive, rekindled, rekindles, remapping, replaying, reshoeing, retracing, semisweet, showtimes, tricklier, ballerinas, beflowered, copulation, defeatures, delighters, delightful, denotation, depolished, depolishes, deportable, exhalation, formalwear, hermitages, inadequate, microluxes, picarooned, prelimited, reaccredit, reacquired, reacquires, reassigned, rechoosing, remarrying, replanning, resketched, resketches, resummoned, revivified, revivifies, unchurched, unchurches, unchurchly, ungraceful, unneurotic, wilinesses, ailanthuses, allopatries, cocounseled, defloration, inalienable, indivisible, invigilated, invigilates, invigilator, invocations, laundresses, reattempted, unresistant, dreaminesses, fiercenesses, paradisiacal, radiometries, repetitional, storminesses, uniformities, alkalimetries, mindfulnesses, outmaneuvered, surgeonfishes, unquietnesses, desegregations, inviolatenesses, deindustrialized, deindustrializes]

Answer for longcase3:
[greenhorn, greenheads, greenheart, greenstones, oversupplied, oversupplies, soldierships, survivorships]

Answer for longcase4:
["deathwatches","handcuffed"]
*/