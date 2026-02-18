// Liskov Substitution Principle (LSP)
// Example: Sparrow vs Penguin (Interface implementation)

// ------------------------------------------
// ❌ Example of LSP Violation (Wrong Way)
// ------------------------------------------

abstract class BirdBad {
  void fly();
}

class SparrowBad implements BirdBad {
  @override
  void fly() {
    print("Flying...");
  }
}

class PenguinBad implements BirdBad {
  @override
  void fly() {
    // ❌ Violation: Penguin is a bird, but it cannot fly!
    // Throwing an exception breaks the behavior expected for a Bird.
    throw Exception("Penguins can't fly!");
  }
}

// Function expects any Bird to be able to fly
void makeBirdFlyBad(BirdBad bird) {
  bird.fly();
}

// ------------------------------------------
// ✅ Correct Way (Follow LSP)
// ------------------------------------------

abstract class Bird {}

abstract class FlyingBird implements Bird {
  void fly();
}

class Sparrow implements FlyingBird {
  @override
  void fly() {
    print("Sparrow flying");
  }
}

class Penguin implements Bird {
  // Penguins are Birds but not FlyingBirds
}

void makeBirdFlyGood(FlyingBird bird) {
  bird.fly();
}

// ------------------------------------------
// 🚀 Demonstration
// ------------------------------------------

void main() {
  print('=== Liskov Substitution Principle (LSP) ===\n');

  print('❌ WRONG WAY:');
  final sparrowBad = SparrowBad();
  final penguinBad = PenguinBad();

  makeBirdFlyBad(sparrowBad); // Works
  try {
    print('Trying to make Penguin fly...');
    makeBirdFlyBad(penguinBad); // Now directly passing as it implements BirdBad
  } catch (e) {
    print('💥 App crashed: $e');
  }

  print('\n✅ CORRECT WAY:');
  final sparrow = Sparrow();
  final penguin = Penguin();

  makeBirdFlyGood(sparrow); // Works safely

  // makeBirdFlyGood(penguin);
  // 🛑 Compiler Error! This prevents the crash before it happens.
  print('Penguin instance (${penguin.runtimeType}) created safe from fly() expectations.');

  print('\n✔ No crashes');
  print('✔ Clean architecture');
  print('✔ Safer polymorphism');
}
