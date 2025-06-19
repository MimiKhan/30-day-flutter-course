void main() {
  // Example 1: Basic switch case
  String day = 'Monday';
  switch (day) {
    case 'Monday':
      print('Start of the week!');
      break;
    case 'Friday':
      print('Weekend’s near!');
      break;
    default:
      print('Just another day.');
  }

  // Example 2: Switch with numbers
  int rating = 4;
  switch (rating) {
    case 5:
      print('Excellent!');
      break;
    case 4:
      print('Good job!');
      break;
    default:
      print('Needs improvement.');
  }

  // Example 3: Switch with multiple cases
  String fruit = 'Apple';
  switch (fruit) {
    case 'Apple':
    case 'Banana':
      print('Healthy choice!');
      break;
    case 'Candy':
      print('Sweet treat!');
      break;
    default:
      print('Unknown food.');
  }

  // Example 4: Switch with default only
  String status = 'Unknown';
  switch (status) {
    default:
      print('Status not recognized.');
  }
}