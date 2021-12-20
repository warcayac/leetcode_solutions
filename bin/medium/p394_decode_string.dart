const _pattern = r'(?:(\d{1,3})\[([a-z]+)\])';

void decodeString(String encodedStr) {
  if (encodedStr.length > 30) throw 'Constraint violated.';

  var re = RegExp(_pattern);
  while (re.hasMatch(encodedStr)) {
    var match = re.firstMatch(encodedStr)!;
    var iteration = int.tryParse(match.group(1)!) ?? 0;
    var string = match.group(2)!;

    if (iteration < 1 || iteration > 30) throw 'Constraint violated.';

    var newString = string * iteration;
    encodedStr = encodedStr.replaceFirst(re, newString);
  }
  print(encodedStr);
}

void main(List<String> args) {
  decodeString('3[a2[c]]2[abc]3[cd]ef');
}