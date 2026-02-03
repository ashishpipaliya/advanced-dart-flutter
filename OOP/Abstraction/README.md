# Abstraction

## 📌 What is it?

An abstract class provides a blueprint that other classes must follow. It can declare abstract methods and properties (no implementation) which concrete subclasses must implement, and it can also provide concrete methods or variables that subclasses inherit.

In short: abstraction exposes essential operations while hiding implementation details, and abstract classes enforce a contract for subclasses.

## ⚡ Example

An abstract `PaymentMethod` below enforces a `pay()` method and an abstract `providerName` getter. It also provides a concrete `info()` method that uses the abstract getter — demonstrating abstract vs concrete members.

### `extends` vs `implements`

- Use `extends` when you want to inherit the abstract class's concrete behaviour and only provide implementations for the abstract members. The subclass gets the concrete methods for free.
- Use `implements` when you want to provide a completely new implementation — you must implement every instance member (including concrete methods) declared on the class or abstract class you `implements`.

The `main.dart` example shows both approaches: classes that `extends` the abstract class inherit `info()`, while a class that `implements` must re-implement `info()` itself.

## 🚀 Run the example

```bash
cd "OOP/Abstraction"
dart main.dart
```
