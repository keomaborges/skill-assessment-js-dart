import 'dart:math';
import 'dart:io';

/// The reference does not require a language. So I chose to Dart, my favourite
/// programming language, that I have been learning.
///
/// In Dart, the magic happens in the main() method. The solution algorithm
/// is in the method solution().
void main() {
  print('Pair of Indices Program');
  print('');
  print('Type the array A values separated by sapces:');
  var inputA = stdin.readLineSync();

  if (inputA == 'test') {
    var a = [0, 1, 2, 2, 3, 5];
    var b = [500000, 500000, 0, 0, 0, 20000];
    var sol = solution(a, b);

    print('Array of indexes: ' + sol.toString());
    print('Number of pairs: ' + sol.length.toString());

    return;
  }

  var a = <int>[];
  for (var el in inputA.split(' ')) {
    a.add(int.parse(el));
  }

  print('Type the array B values separated by sapces:');
  var inputB = stdin.readLineSync();
  var b = <int>[];
  for (var el in inputB.split(' ')) {
    b.add(int.parse(el));
  }

  var sol = solution(a, b);
  print('Array of indexes: ' + sol.toString());
  print('Number of pairs: ' + sol.length.toString());

  return;
}

/// The reference says this should return the number of multiplicative pairs,
/// but that can be easily obtained through `length` getter. For debugging
/// purposes, it is better having the entire array result.
List solution(List<int> listA, List<int> listB) {
  /**
   * I am assuming that B must be in function of A. I mean, it does not matter
   * if B is larger than A. The remain values will be ignored. But, if B is
   * shorter, the call below will fill the positions with zeroes. So I guarantee
   * A and B has the same length.
   *
   * It is not explicitly written in the document, but I think it is a fair
   * assumption.
   */
  if (listB.length < listA.length) {
    var previousLen = listB.length;
    listB.length = listA.length;
    listB.fillRange(previousLen, listB.length, 0);
  }

  var listC = [];

  /**
   * Defines the list C according to the reference.
   */
  for (var i = 0; i < listA.length; i++) {
    var a = validateInteger(listA[i], 1000);
    var b = validateInteger(listB[i], 999999);

    listC.add(a + b / pow(10, 6)); //10^6 = 1,000,000
  }

  /**
   * Loops the C array and verifies each pair of indices. The comparison j
   * index is always greater than i. This way, less iterations are made and
   * duplicated entries never happen.
   */
  var result = [];
  for (var i = 0; i < listC.length; i++) {
    var j = i + 1;
    while (j < listC.length) {
      var multiplication = validateInteger((listC[i] * listC[j]), pow(10, 7));

      if (multiplication >= (listC[i] + listC[j])) {
        result.add([i, j]);
      }

      j++;
    }
  }

  /**
   * Returns the list of pairs. A list of lists, actually.
   */
  return result;
}

/// Validates an integer in the script context.
///
/// If it is invalid or negative, returns 0.
///
/// If it is greater than the max reference, returns the max.
///
/// Otherwise, the value is valid and it is returned.
num validateInteger(num value, num max) {
  if (value.isNegative || value.isNaN) {
    return 0;
  }

  if (value > max) {
    return max;
  }

  return value;
}
