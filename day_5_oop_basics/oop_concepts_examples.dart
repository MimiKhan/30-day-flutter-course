void main() {
  // Example 1: Inheritance
  Student student = Student('Alice', 20, 'A');
  print('Student: ${student.name}, Grade: ${student.grade}');

  // Example 2: Polymorphism
  Animal dog = Dog();
  Animal cat = Cat();
  print(dog.makeSound()); // Woof!
  print(cat.makeSound()); // Meow!

  // Example 3: Abstraction
  Circle circle = Circle(5.0);
  print('Area: ${circle.calculateArea()}');

  // Example 4: Singleton
  var settings1 = Settings();
  var settings2 = Settings();
  print(identical(settings1, settings2)); // true (same instance)
}

// Inheritance
class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class Student extends Person {
  String grade;

  Student(String name, int age, this.grade) : super(name, age);
}

// Polymorphism
abstract class Animal {
  String makeSound();
}

class Dog extends Animal {
  @override
  String makeSound() => 'Woof!';
}

class Cat extends Animal {
  @override
  String makeSound() => 'Meow!';
}

// Abstraction
abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() => 3.14 * radius * radius;
}

// Singleton
class Settings {
  static final Settings _instance = Settings._internal();

  factory Settings() => _instance;

  Settings._internal();
}