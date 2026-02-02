// Builder Pattern
// Separate the construction of a complex object from its representation,
// allowing the same construction process to create different representations.

// Product: complex object
class Computer {
  final String cpu;
  final String ram;
  final String storage;
  final String gpu;
  final String os;

  Computer({
    required this.cpu,
    required this.ram,
    required this.storage,
    required this.gpu,
    required this.os,
  });

  @override
  String toString() {
    return '''
    Computer Specs:
    - CPU: $cpu
    - RAM: $ram
    - Storage: $storage
    - GPU: $gpu
    - OS: $os
    ''';
  }
}

// Builder: constructs the Computer step by step
class ComputerBuilder {
  late String _cpu;
  late String _ram;
  late String _storage;
  late String _gpu;
  late String _os;

  ComputerBuilder setCpu(String cpu) {
    _cpu = cpu;
    return this;
  }

  ComputerBuilder setRam(String ram) {
    _ram = ram;
    return this;
  }

  ComputerBuilder setStorage(String storage) {
    _storage = storage;
    return this;
  }

  ComputerBuilder setGpu(String gpu) {
    _gpu = gpu;
    return this;
  }

  ComputerBuilder setOs(String os) {
    _os = os;
    return this;
  }

  Computer build() {
    return Computer(
      cpu: _cpu,
      ram: _ram,
      storage: _storage,
      gpu: _gpu,
      os: _os,
    );
  }
}

void main() {
  print('=== Builder Pattern ===\n');

  // Build a gaming PC
  final gamingPc = ComputerBuilder()
      .setCpu('Intel i9-13900K')
      .setRam('32GB DDR5')
      .setStorage('2TB NVMe SSD')
      .setGpu('RTX 4090')
      .setOs('Windows 11')
      .build();

  print('Gaming PC:');
  print(gamingPc);

  // Build a budget PC
  final budgetPc = ComputerBuilder()
      .setCpu('AMD Ryzen 5 5500')
      .setRam('16GB DDR4')
      .setStorage('512GB SSD')
      .setGpu('Integrated Graphics')
      .setOs('Linux Ubuntu')
      .build();

  print('\nBudget PC:');
  print(budgetPc);

  print('📌 Key idea: The builder constructs complex objects step by step.');
  print('   Easy to create variations without constructor overloading.');
}
