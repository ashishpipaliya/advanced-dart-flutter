class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void birthday() {
    age += 1;
  }

  @override
  String toString() => '$name, age $age';
}

void main() {
  print('=== Classes & Objects ===');

  final alice = Person('Alice', 30);
  final bob = Person('Bob', 25);

  print(alice); // Alice, age 30
  alice.birthday();
  print('After birthday: $alice');

  print(bob); // Bob, age 25
}
