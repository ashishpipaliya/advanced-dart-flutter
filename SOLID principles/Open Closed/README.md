# Open/Closed Principle (OCP)

## 📌 What is it?

Software entities (classes, modules, functions) should be **open for extension but closed for modification**. You should be able to add new functionality without changing existing code.

## 🤔 Why Does It Matter?

When you modify existing code:
- **Risk of bugs** — Changes to working code might break existing functionality
- **Hard to maintain** — You have to test everything again after modifications
- **Tight coupling** — New features become dependent on modification points
- **Cascading changes** — One change might require changes everywhere

Instead, if you extend through new code:
- **Safer** — Existing code remains untouched and tested
- **Easier to scale** — Add features without refactoring
- **Better separation** — New code is isolated from old code

## ⚡ Problem vs Solution

### ❌ Problem: Modifying Existing Code

```dart
class PaymentProcessor {
  void processPayment(String method, double amount) {
    if (method == 'creditCard') {
      // Credit card logic
    } else if (method == 'paypal') {
      // PayPal logic
    } else if (method == 'applepay') {
      // Apple Pay logic
    }
    // Adding Crypto? Modify this class again!
    // Adding Bitcoin? Modify this class again!
  }
}
```

**Why is this bad?**
- Every new payment method requires modifying `PaymentProcessor`
- What if you add 10 payment methods? This class becomes huge
- Risk of breaking existing payment methods when adding new ones
- Tests need to be re-run and updated

### ✅ Solution: Extension Through Abstraction

```dart
// Define the contract
abstract class PaymentMethod {
  void process(double amount);
}

// Extend by creating new classes
class CreditCardPayment implements PaymentMethod {
  @override
  void process(double amount) {
    // Credit card logic
  }
}

class PayPalPayment implements PaymentMethod {
  @override
  void process(double amount) {
    // PayPal logic
  }
}

class CryptoPayment implements PaymentMethod {
  @override
  void process(double amount) {
    // Crypto logic - NEW! No modification needed!
  }
}

// Processor is closed for modification
class PaymentProcessor {
  void processPayment(PaymentMethod method, double amount) {
    method.process(amount);
  }
}
```

**Why is this good?**
- Add new payment methods by creating new classes
- `PaymentProcessor` doesn't change
- Existing code is safe and tested
- Easy to scale to 10, 50, or 100 payment methods

## 🎯 When to Use OCP

✅ **Use OCP when:**
- You expect new features/variations to be added
- You want to minimize risk when adding new functionality
- Code is used in multiple places (modifying it affects everything)
- You need clean separation of concerns

❌ **Don't over-apply OCP:**
- Simple if/else statements for rare cases are fine
- Over-engineering simple code with abstractions wastes time
- Use when you actually need extensibility

## 💡 Real-World Examples

| Scenario | Closed for Modification | Open for Extension |
|----------|------------------------|-------------------|
| **Database queries** | `QueryEngine` class | Different `DatabaseAdapter` implementations |
| **File formats** | `FileExporter` class | Different `Formatter` implementations (JSON, CSV, XML) |
| **Notifications** | `NotificationService` | Different `NotificationChannel` implementations (Email, SMS, Push) |
| **Shape calculations** | `AreaCalculator` | Different `Shape` implementations (Circle, Square, Triangle) |

## 🏗️ Techniques to Achieve OCP

### 1. **Abstraction (Interfaces/Abstract Classes)**
Define what variations must implement, not how they do it.

### 2. **Inheritance**
Create base classes that provide common functionality, extend them for specifics.

### 3. **Composition**
Use composition over inheritance to combine behaviors flexibly.

### 4. **Polymorphism**
Use polymorphic behavior to handle different types uniformly.

## 🚀 See It in Action

Run [main.dart](main.dart) to see a complete example with both ❌ bad and ✅ good implementations!

```bash
dart main.dart
```

## 📝 Key Takeaway

> "Write code that you extend, not code that you modify."

Use abstractions to allow new features to be added through extension (new classes), not through modification of existing classes. This keeps your codebase safe, maintainable, and scalable.
