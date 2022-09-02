class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    var list = [...nums1, ...nums2]..sort(((a, b) => a.compareTo(b)));
    var len = list.length;
    var i = len ~/ 2;

    if (len == 0) return 0;
    var median = len.isEven ? (list[i-1] + list[i]) / 2 : list[i] / 1;
    print(median);
    return median;
  } 
}

void main(List<String> args) {
  Solution()
  ..findMedianSortedArrays([1,3], [2])
  ..findMedianSortedArrays([1,2], [3,4])
  ;
}