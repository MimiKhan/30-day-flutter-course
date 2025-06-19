void main() {
  // Example 1: Simple if statement
  int score = 75;
  if (score >= 50) {
    print('You passed!');
  }

  // Example 2: If-else statement
  int age = 16;
  if (age >= 18) {
    print('You can vote.');
  } else {
    print('Too young to vote.');
  }

  // Example 3: Else-if ladder
  int grade = 85;
  if (grade >= 90) {
    print('Grade: A');
  } else if (grade >= 80) {
    print('Grade: B');
  } else {
    print('Grade: C or below');
  }

  // Example 4: Nested if
  bool hasTicket = true;
  bool hasID = true;
  if (hasTicket) {
    if (hasID) {
      print('Welcome to the event!');
    } else {
      print('ID required.');
    }
  } else {
    print('No ticket, no entry.');
  }
}