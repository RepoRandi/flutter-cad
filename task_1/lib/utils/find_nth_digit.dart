import '../models/digit_finder.dart';

DigitFinderResult findNthDigit(int n) {
  if (n <= 0) {
    throw ArgumentError('Digit must be a positive number');
  }

  String sequence = '';
  int number = 1;

  while (sequence.length < n) {
    sequence += number.toString();
    number++;
  }

  int nthDigit = int.parse(sequence[n - 1]);
  int correspondingNumber = 1;

  for (int i = 1; i < number; i++) {
    if (sequence.indexOf(i.toString()) <= n - 1) {
      correspondingNumber = i;
    }
  }

  return DigitFinderResult(nthDigit, correspondingNumber);
}
