class AnyObj {
  int id;
  AnyObj? next;
  AnyObj(this.id);
}


void main(List<String> args) {
  var a = AnyObj(1);
  var b = AnyObj(2);
  var refX = a;
  var refY = refX;
  refX = b;
  print(refX.id);
  print(refY.id);
  
  b.next = a;
  refX.next?.id = 7;
  print(refX.next?.id ?? '?');
  print('\nJob done!');
}