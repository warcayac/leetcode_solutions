import 'package:leetcode/src/utils.dart';

class Solution {
  int reverse(int x) {
    if (!isSigned32bitInteger(x)) return 0;
    var str = x.toString();
    var sign = str[0] == '-' ? '-' : '';
    if (sign.isNotEmpty) str = str.substring(1);
    str = sign + str.split('').reversed.join();
    var result = int.tryParse(str) ?? 0;
    if (!isSigned32bitInteger(result)) result = 0;
    print(result);
    return result;
  }
}

void main(List<String> args) {
  Solution()
  ..reverse(123)
  ..reverse(-123)
  ..reverse(120)
  ;
  // var n = 120;
  // var ni = 21;
  // print('$n => ${n.toRadixString(2)}');
  // print('$ni => ${ni.toRadixString(2)}');
  // print(int.parse('1101101', radix: 2));
  // print('-123 => ${(-123).toRadixString(2)}');
  // print('-321 => ${(-321).toRadixString(2)}');
}

/*
1000000000 512=8³  0x200
0001000000 64 =8²  0x40
0000001000 8  =8¹  0x8
*/