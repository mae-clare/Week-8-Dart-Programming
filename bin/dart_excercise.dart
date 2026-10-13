import 'dart:io';

String evaluateStudentPerformance(List<String> rawScores) {
  try {
    if (rawScores.isEmpty) {
      return 'Error: No score data provided.';
    }

    double totalSum = 0.0;
    int validCount = 0;

    for (String scoreStr in rawScores) {
      double score = double.parse(scoreStr);

      if (score < 0 || score > 100) {
        throw FormatException('Score $score out of valid range (0–100).');
      }

      totalSum += score;
      validCount++;
    }

    double average = totalSum / validCount;

    if (average >= 90.0) {
      return 'Average: ${average.toStringAsFixed(2)}% | Status: Excellent (Passed with Distinction)';
    } else if (average >= 75.0) {
      return 'Average: ${average.toStringAsFixed(2)}% | Status: Passed';
    } else {
      return 'Average: ${average.toStringAsFixed(2)}% | Status: Failed (Needs Improvement)';
    }
  } catch (e) {
    return 'Processing Error Handled: ${e.toString()}';
  }
}

void main() {
  print(' DART FUNDAMENTALS LOGIC PROBLEM SET  ');

  List<String> validScores = ['85.5', '92.0', '78.0', '88.5'];
  print('--- Test Case 1: Valid Inputs ---');
  print('Inputs: $validScores');
  print('Result: ${evaluateStudentPerformance(validScores)}\n');

  List<String> invalidScores = ['85.5', 'abc', '90.0'];
  print('--- Test Case 2: Bad Input (Non-numeric value) ---');
  print('Inputs: $invalidScores');
  print('Result: ${evaluateStudentPerformance(invalidScores)}\n');

  List<String> outOfRangeScores = ['95.0', '105.0', '80.0'];
  print('--- Test Case 3: Bad Input (Out-of-range value) ---');
  print('Inputs: $outOfRangeScores');
  print('Result: ${evaluateStudentPerformance(outOfRangeScores)}\n');
}
