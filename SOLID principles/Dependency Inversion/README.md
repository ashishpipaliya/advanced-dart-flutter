# Dependency Inversion Principle (DIP)

## 📌 What is it?

High-level modules should not depend on low-level modules. Both should depend on abstractions (e.g., interfaces or abstract classes).

## ⚡ Short Example

- Problem: A high-level class directly uses a concrete notifier (hard to change/test).
- Solution: Depend on a `Notifier` abstraction and inject concrete implementations. The example requires callers to provide a non-null `Notifier` (no hidden fallbacks), making dependencies explicit and safer.

## ✅ Why this helps
- Easier to swap implementations (Email, SMS, Mock)
- Easier to test (inject a mock notifier)
- Reduces coupling between modules

## 🚀 Run the example

```bash
dart main.dart
```

## 📝 Key Takeaway

> "Depend on abstractions, not on concretions."