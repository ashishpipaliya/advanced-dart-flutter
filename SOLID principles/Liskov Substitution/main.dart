// Liskov Substitution Principle (LSP)
// Example using vehicles: show a BAD design that forces all vehicles to refuel,
// and a GOOD design that separates fuel and electric responsibilities.

// ----------------
// ❌ BAD design
// ----------------
abstract class Vehicle {
  void refuel();
  void move();
}

class ElectricCarBad extends Vehicle {
  @override
  void refuel() {
    // Electric car forced to implement refuel() — maps to charging.
    // This mixes responsibilities and can be confusing for clients.
    print('Charging the battery...');
  }

  @override
  void move() {
    print('ElectricCar moves');
  }
}

class PetrolCarBad extends Vehicle {
  @override
  void refuel() {
    print('Refilling the petrol...');
  }

  @override
  void move() {
    print('PetrolCar moves');
  }
}

// Service expects every Vehicle to be refuelable — this is fragile.
void serviceVehicleBad(Vehicle vehicle) {
  vehicle.refuel();
  // other servicing steps
}

// ----------------
// ✅ GOOD design
// ----------------
abstract class BaseVehicle {
  void move();
}

abstract class FuelVehicle implements BaseVehicle {
  void refuel();
}

abstract class ElectricVehicle implements BaseVehicle {
  void charge();
}

class ElectricCar implements ElectricVehicle {
  @override
  void charge() {
    print('Charging the battery...');
  }

  @override
  void move() {
    print('ElectricCar moves');
  }
}

class PetrolCar implements FuelVehicle {
  @override
  void refuel() {
    print('Refilling the petrol...');
  }

  @override
  void move() {
    print('PetrolCar moves');
  }
}

void serviceFuelVehicle(FuelVehicle v) {
  v.refuel();
  // other fuel-specific service
}

void serviceElectricVehicle(ElectricVehicle v) {
  v.charge();
  // other electric-specific service
}

void main() {
  print('=== Liskov Substitution Principle (Vehicle example) ===\\n');

  print('❌ BAD: serviceVehicleBad assumes every Vehicle has refuel()');
  final eBad = ElectricCarBad();
  final pBad = PetrolCarBad();
  serviceVehicleBad(pBad); // ok for petrol
  serviceVehicleBad(eBad); // works, but mixes concepts (charging as refuel)

  print('\\n✅ GOOD: Separate contracts for fuel vs electric');
  final e = ElectricCar();
  final p = PetrolCar();
  serviceElectricVehicle(e);
  serviceFuelVehicle(p);

  print("\\n📌 Key LSP rule: Subtypes must honor the parent's contract.");
  print("If a subtype cannot fulfill a parent's contract, don\'t inherit from it.");
}
