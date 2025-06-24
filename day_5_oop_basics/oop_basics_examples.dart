void main() {
  // Example 1: Basic class and object
  Person bob = Person('Bob', 30);
  print('Name: ${bob.name}, Age: ${bob.age}');

  // Example 2: Class with constructor
  Car car = Car('Toyota', 2020);
  print(car.description());

  // Example 3: Getters and setters
  Student alice = Student('Alice', 20);
  alice.grade = 'A'; // Using setter
  print('Student: ${alice.name}, Grade: ${alice.grade}'); // Using getter

  // Example 4: Named constructor
  Person guest = Person.guest();
  print('Guest: ${guest.name}, Age: ${guest.age}');
}

// Class with constructor
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  // Named constructor
  Person.guest() : name = 'Guest', age = 0;
}

// Class with method
class Car {
  String brand;
  int year;

  Car(this.brand, this.year);

  String description() {
    return '$brand from $year';
  }
}

// Class with getters and setters
class Student {
  String name;
  int age;
  String? _grade; // Private variable

  Student(this.name, this.age);

  String get grade => _grade ?? 'No grade';
  set grade(String value) => _grade = value;
}