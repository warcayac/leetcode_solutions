class Solution {
  int myAtoi(String s) {
    final re = RegExp(r'^\s*([\+\-]?(\d+))');
    final lowLimit = -2147483648; // -2^31
    final upLimit = 2147483647;   // 2^31 - 1
    const maxLen = 10;

    if (!re.hasMatch(s)) return 0;
    var value = re.firstMatch(s)!.group(1)!;
    var absValue = re.firstMatch(s)!.group(2)!;
    var tooLong = absValue.length > maxLen;
    var result = 0;

    if (tooLong) {
      var pos = absValue.indexOf(RegExp(r'[^0]'));
      if (pos >= 0) {
        if (pos > 0) absValue = absValue.substring(pos);
        if (absValue.length > maxLen) {
          result = value[0] == '-' ? lowLimit : upLimit;
        }
      }
    }
    
    if (result == 0) {
      result = int.parse(value);

      if (result < lowLimit) result = lowLimit;
      if (result > upLimit) result = upLimit;
    }

    print(result);
    return result;
  }
}

void main() {
  Solution()
    ..myAtoi('   ho123')
    ..myAtoi('')
    ..myAtoi('42')
    ..myAtoi('   -42')
    ..myAtoi('4193 with words')
    ..myAtoi('20000000000000000000')
    ..myAtoi('  -0000000000012345678')
    ..myAtoi('    0000000000000   ')
    ;
}
