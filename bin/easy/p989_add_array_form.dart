class Solution {
  List<int> addToArrayForm(List<int> num, int k) {
    num = [0, ...num];
    var addend = [0,...k.toString().split('').map(int.parse)];
    var diff = (num.length - addend.length).abs();
    var extra = 0;

    if (num.length < addend.length) {
      num = [...List.filled(diff, 0), ...num];
      diff = 0;
    }
    
    for (var i = num.length-1; i >= 0; i--) {
      var idx = i - diff;
      if (idx < 0 && extra == 0) break;
      var value = idx < 0 ? 0 : addend[idx];
      var result = value + num[i] + extra;

      extra = 0;
      if (result > 9) {
        result = result.remainder(10);
        extra = 1;
      }
      num[i] = result;
    }

    extra = -1;
    for (var i = 0; i < num.length; i++) {
      if (num[i] != 0) {
        extra = i;
        break;
      }
    }
    if (extra > 0) num = num.getRange(extra, num.length).toList();

    return num;
  }

  void addToArrayForm2(List<int> num, int k) {
    print(addToArrayForm(num, k));
  }
}

void main(List<String> args) {
  Solution()
  ..addToArrayForm2([1,2,0,0], 34)  // [1, 2, 3, 4]
  ..addToArrayForm2([2,7,4], 181)   // [4, 5, 5]
  ..addToArrayForm2([2,1,5], 806)   // [1, 0, 2, 1]
  ..addToArrayForm2([9,9,9,9,9,9,9,9,9,9], 1) // [1,0,0,0,0,0,0,0,0,0,0]
  ..addToArrayForm2([1,2,6,3,0,7,1,7,1,9,7,5,6,6,4,4,0,0,6,3], 516) //[1,2,6,3,0,7,1,7,1,9,7,5,6,6,4,4,0,5,7,9]
  ;
}