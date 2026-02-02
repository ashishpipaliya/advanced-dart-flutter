# Observer Pattern

## 📌 What is it?

The Observer pattern defines a one-to-many relationship between objects. When a subject changes state, all its observers are notified automatically and independently.

## 🤔 When to use

- Event handling systems (user interactions, data changes)
- Real-time notifications (news, stock prices, system alerts)
- MVC architectures where models notify views of changes
- Loose coupling between event producers and consumers

## ⚡ Example (News Channel)

- `Observer` — interface for objects that want to be notified
- `EmailSubscriber`, `SMSSubscriber` — concrete observers
- `NewsChannel` — subject that manages observers and notifies them

When `publishNews()` is called, all subscribers are notified automatically.

## 🚀 Run the example

```bash
cd "Design patterns/Observer"
dart main.dart
```

## 📝 Key Takeaway

Use the Observer pattern when multiple objects need to react to state changes in another object, without tight coupling. It's especially powerful for event-driven architectures.
