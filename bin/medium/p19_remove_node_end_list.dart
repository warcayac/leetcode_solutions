class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  static ListNode? makeFrom(List<int> values) {
    if (values.isEmpty) return null;
    var list = List.generate(values.length, (i) => ListNode(values[i]));
    for (var i = 0; i < list.length - 1; i++) {
      list[i].next = list[i+1];
    }

    return list.first;
  }

  @override
  String toString() => '$val${next != null ? ' => $next' : ''}';
}

class Solution {
  final debugging = false;

  ListNode? removeNthFromEnd(ListNode? head, int n) {
    if (head == null || n < 1) return null;

    // convert to list
    ListNode? node = head;
    var list = <ListNode>[];
    while (node != null) {
      list.add(node);
      node = node.next;
    }
    if (debugging) print(head);
    // delete reference
    var idx = list.length - n;
    idx <= 0
      ? head = head.next
      : list[idx - 1].next = idx + 1 < list.length ? list[idx + 1] : null;

    if (debugging) { print(head); print('*'*20); }
    return head;
  }

  void removeNthFromEnd2(ListNode? head, int n) {
    print(removeNthFromEnd(head, n));
  }
}

void main(List<String> args) {
  Solution()
  ..removeNthFromEnd2(ListNode.makeFrom([1,2,3,4,5]), 2) // 1235
  ..removeNthFromEnd2(ListNode.makeFrom([1]), 1)  // null
  ..removeNthFromEnd2(ListNode.makeFrom([1,2]), 1)  // 1
  ..removeNthFromEnd2(ListNode.makeFrom([1,2]), 2)   // 2
  ;
}