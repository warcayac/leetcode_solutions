import 'package:collection/collection.dart';

void main(List<String> args) {
  var chars = ['a','a','a','b','b','a','a','c'];
  // var re = RegExp(r'(?:(.))(?!\1)');
  // print(chars.join().split(re));
  print(chars.splitBetween((a, b) => a != b));
  print('\nJob done!');
}