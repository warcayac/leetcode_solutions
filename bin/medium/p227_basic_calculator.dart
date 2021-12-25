// https://leetcode.com/problems/basic-calculator-ii/

final re1 = RegExp(r'(\d+)\s?([\*\/])\s?(\d+)');
final re2 = RegExp(r'(\d+)\s?([\+\-])\s?(\d+)');

String doOperation(RegExpMatch match, String expression) {
  var expr = match.group(0)!;
  var num1 = int.parse(match.group(1)!);
  var num2 = int.parse(match.group(3)!);
  var op = match.group(2)!;
  late int result;
  
  switch (op) {
    case '*': result = num1 * num2; break;
    case '/': result = (num1 / num2).truncate(); break;
    case '+': result = num1 + num2; break;
    case '-': result = num1 - num2; break;
    default:
  }
  
  return expression.replaceFirst(expr, result.toString());
}

void calculate(String expression) {
  if (re1.hasMatch(expression)) {
    expression = doOperation(re1.firstMatch(expression)!, expression);
    calculate(expression);
  } else {
    if (re2.hasMatch(expression)) {
      expression = doOperation(re2.firstMatch(expression)!, expression);
      calculate(expression);
    } else {
      print(expression.trim());
    }
  }
}

void main(List<String> args) {
  calculate('3+2*2');
  calculate(' 3/2 ');
  calculate(' 3+5 / 2 ');
  print('\nDone!');
}