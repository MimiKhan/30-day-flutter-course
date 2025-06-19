void main() {
  // Example 1: For loop to print numbers
  for (int i = 1; i <= 3; i++) {
    print('Number: $i');
  }

  // Example 2: For loop with step
  for (int i = 2; i <= 10; i += 2) {
    print('Even number: $i');
  }

  // Example 3: While loop for countdown
  int countdown = 5;
  while (countdown > 0) {
    print('Countdown: $countdown');
    countdown--;
  }

  // Example 4: While loop with condition
  int energy = 3;
  while (energy > 0) {
    print('Keep coding! Energy left: $energy');
    energy--;
  }
}