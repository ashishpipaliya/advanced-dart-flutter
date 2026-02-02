# Builder Pattern

## 📌 What is it?

The Builder pattern separates the construction of a complex object from its representation, allowing the same construction process to create different representations.

## 🤔 When to use

- Objects with many optional or required parameters
- Avoid complex constructors with many parameters (telescoping constructor anti-pattern)
- Create different variants of a complex object
- Make object construction readable and maintainable

## ⚡ Example (Computer Configuration)

- `Computer` — the complex product with many components
- `ComputerBuilder` — constructs the Computer step by step
- Chainable methods return `this` for fluent interface

Instead of `Computer(cpu, ram, storage, gpu, os, ...)`, use:

```dart
Computer pc = ComputerBuilder()
  .setCpu('...')
  .setRam('...')
  .setStorage('...')
  .build();
```

## 🚀 Run the example

```bash
cd "Design patterns/Builder"
dart main.dart
```

## 📝 Key Takeaway

Use the Builder pattern when constructing complex objects with many optional parameters. It makes code more readable, maintainable, and flexible compared to telescoping constructors or factory methods with many arguments.
