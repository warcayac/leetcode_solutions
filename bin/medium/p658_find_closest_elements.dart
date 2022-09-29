class Solution {
  final debugging = false;

  List<int> findClosestElements(List<int> arr, int k, int x) {
    final len = arr.length;

    if(arr.isEmpty || len <= k) return arr;
    if (x <= arr.first) return arr.take(k).toList();
    if (x >= arr.last) return arr.getRange(len - k, len).toList();

    var targetIdx = getIndexByDifferences(arr, x, 0, len - 1);
    var counter = 1;
    var firstIdx = targetIdx;
    var lastIdx = targetIdx;
    var canLeft = false;
    var canRight = false;

    while (counter < k) {
      canLeft = firstIdx - 1 >= 0;
      canRight = lastIdx + 1 < len;

      if (canLeft && canRight) {
        x - arr[firstIdx - 1] <= arr[lastIdx + 1] - x ? firstIdx-- : lastIdx++;
      } else {
        canLeft ? firstIdx-- : lastIdx++;
      }

      counter++;
    }

    return arr.getRange(firstIdx, lastIdx + 1).toList();
  }

  int getIndexByDifferences(List<int> sortedList, int target, int firstIdx, int lastIdx) {
    if (firstIdx == lastIdx) return firstIdx;

    var first = sortedList[firstIdx];
    var last = sortedList[lastIdx];

    if (first == target) return firstIdx;
    if (last == target) return lastIdx;
    if (lastIdx - firstIdx == 1 && first != target && last != target) {
      return target - first <= last - target ? firstIdx : lastIdx;
    }

    var middleIdx = (firstIdx + lastIdx) ~/ 2;
    if (sortedList[middleIdx] == target) return middleIdx;
    if (debugging) print('Indexes: $firstIdx | $middleIdx | $lastIdx');

    return target - sortedList[middleIdx] > 0
      ? getIndexByDifferences(sortedList, target, middleIdx, lastIdx)
      : getIndexByDifferences(sortedList, target, firstIdx, middleIdx);
  }

  void findClosestElements2(List<int> arr, int k, int x) {
    print(findClosestElements(arr, k, x));
    print('*'*20);
  }
}

void main(List<String> args) {
  Solution()
  ..findClosestElements2([1,2,3,4,5], 4, 3)   //  [1,2,3,4]
  ..findClosestElements2([1,2,3,4,5], 4, -1)   //  [1,2,3,4]
  ..findClosestElements2([1,2,3,4,5], 4, 7)   //  [2,3,4,5]
  ..findClosestElements2([1,2,3,4,5,6,7,8,9,10,12,14,16,17,18,20], 4, 13)   // [10,12,14,16]
  ..findClosestElements2([1,1,1,10,10,10], 2, 9)  // [10]
  ..findClosestElements2([1,3], 1, 2)  // [1]
  ;
}
