# Interfaces

## 📌 What is it?

An interface is a contract of methods and properties that implementing classes must provide, decoupling API from implementation.

## 🤔 When to use

- Define a contract separate from implementation
- Allow multiple unrelated classes to conform to the same API
- Enable dependency injection and easier testing

## ⚡ Example

`Notifier` is an interface; `EmailNotifier` and `SmsNotifier` implement it.

```dart
final notifiers = [EmailNotifier(), SmsNotifier()];
for (var n in notifiers) n.notify('Hello');
```

## 🚀 Run the example

```bash
cd "OOP/Interfaces"
dart main.dart
```

## 📝 Key Takeaway

Use interfaces (`implements`) to define behaviour contracts that many classes can fulfill, keeping code decoupled and testable.
