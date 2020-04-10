import 'main.dart';

main() {
  print('Pair of Indices Program');
  print('');

  var a = [0, 1, 2, 2, 3, 5];
  var b = [500000, 500000, 0, 0, 0, 20000];
  var sol = solution(a, b);

  print('Array of indexes: ' + sol.toString());
  print('Number of pairs: ' + sol.length.toString());
}