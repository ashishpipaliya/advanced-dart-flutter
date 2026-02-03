class Animal {
  String name;
  Animal(this.name);

  void speak() {
    print('$name makes a sound');
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void speak() {
    print('$name barks');
  }
}

void main() {
  print('=== Inheritance ===');
  final animal = Animal('Generic');
  final dog = Dog('Rex');

  animal.speak(); // Generic makes a sound
  dog.speak();    // Rex barks
}
