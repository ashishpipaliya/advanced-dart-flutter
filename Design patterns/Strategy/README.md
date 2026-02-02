# Strategy Pattern

## 📌 What is it?

The Strategy pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable. Strategy lets the algorithm vary independently from clients that use it.

## 🤔 When to use

- Multiple ways to perform a task (sorting, payment, export, compression)
- Algorithm selection at runtime based on conditions or user input
- Avoid long if/else chains for selecting behavior

## ⚡ Example (Payment Methods)

- `PaymentStrategy` — interface for different payment algorithms
- `CreditCardPayment`, `PayPalPayment`, `CryptoPayment` — concrete strategies
- `ShoppingCart` — context that uses a strategy without knowing implementation details

The cart doesn't care *how* payment happens; it delegates to the selected strategy.

## 🚀 Run the example

```bash
cd "Design patterns/Strategy"
dart main.dart
```

## 📝 Key Takeaway

Use the Strategy pattern to encapsulate algorithms so you can swap them at runtime without changing client code. This is cleaner than long if/else chains and makes adding new strategies painless.
