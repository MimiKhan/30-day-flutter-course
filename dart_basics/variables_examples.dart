void main() {
  // Example 1: Using var for flexible variables
  var score = 100;
  print('Initial score: $score');
  score = 150; // Can change value
  print('Updated score: $score');

  // Example 2: Using final for one-time assignment
  final playerName = 'Alex';
  print('Player: $playerName');
  // playerName = 'Sam'; // Error: final can't be changed

  // Example 3: Using const for compile-time constant
  const maxLives = 3;
  print('Max lives: $maxLives');
  // maxLives = 5; // Error: const can't be changed

  // Example 4: Combining variables
  var totalPoints = 500;
  totalPoints += 100;
  print('Total points after bonus: $totalPoints');
}