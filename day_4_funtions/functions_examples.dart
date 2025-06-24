void main() {
  // Example 1: Simple function with no parameters or return
  void sayHello() {
    print('Hello, Flutter beginner!');
  }

  sayHello();

  // Example 2: Function with parameters, no return
  void printSum(int a, int b) {
    print('Sum of $a and $b is ${a + b}');
  }

  printSum(10, 5);

  // Example 3: Function with parameters and return value
  int calculateArea(int length, int width) {
    return length * width;
  }

  int area = calculateArea(5, 3);
  print('Area of rectangle: $area');

  // Example 4: Function with optional parameters
  String greetUser(String name, [String greeting = 'Hi']) {
    return '$greeting, $name!';
  }

  print(greetUser('Alex')); // Hi, Alex!
  print(greetUser('Sam', 'Welcome')); // Welcome, Sam!
}
