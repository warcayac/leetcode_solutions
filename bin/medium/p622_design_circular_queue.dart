class Node<T extends Object> {
  final T value;
  Node<T>? next;
  /* ---------------------------------------------------------------------------- */
  Node(this.value);
  /* ---------------------------------------------------------------------------- */
}


class MyCircularQueue {
  final int size;
  var _counter = 0;
  Node<int>? _header, _footer;
  /* ---------------------------------------------------------------------------- */
  MyCircularQueue(this.size);
  /* ---------------------------------------------------------------------------- */
  bool enQueue(int value) {
    if (_counter >= size) return false;
    
    var node = Node(value);
    if (_header != null) {
      _footer!.next = node;
    } else {
      _header = node;
    }
    _footer = node;
    _counter++;
    
    return true;
  }
  /* ---------------------------------------------------------------------------- */
  bool deQueue() {
    if (_counter <= 0 || _header == null) return false;

    _counter--;
    if (_counter > 0) {
      _header = _header!.next;
    } else{
      _counter = 0;
      _header = null;
      _footer = null;
    }

    return true;
  }
  /* ---------------------------------------------------------------------------- */
  int Front() {
    return _counter <= 0 || _header == null
      ? -1
      : _header!.value;
  }
  /* ---------------------------------------------------------------------------- */
  int Rear() {
    return _counter <= 0 || _header == null
      ? -1
      : _footer!.value;
  }
  /* ---------------------------------------------------------------------------- */
  bool isEmpty() => _counter <= 0;
  /* ---------------------------------------------------------------------------- */
  bool isFull() => _counter >= size;
}


void main(List<String> args) {
  var obj = MyCircularQueue(3);
  print(obj.enQueue(1));
  print(obj.enQueue(2));
  print(obj.enQueue(3));
  print(obj.enQueue(4));
  print(obj.Rear());
  print(obj.isFull());
  print(obj.deQueue());
  print(obj.enQueue(4));
  print(obj.Rear());
}