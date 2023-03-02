class Solution {
  int searchInsert(List<int> nums, int target) {
    if (nums.isEmpty) return 0;

    var i = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] >= target) break;
    }
    return i;
  }

  void searchInsert2(List<int> nums, int target) {
    print(searchInsert(nums, target));
    print('*'*40);
  }
}

void main(List<String> args) {
  Solution()
    ..searchInsert2([1,3,5,6], 5) // 2
    ..searchInsert2([1,3,5,6], 2) // 1
    ..searchInsert2([1,3,5,6], 7) // 4
  ;
}