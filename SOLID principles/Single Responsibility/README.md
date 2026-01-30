# Single Responsibility Principle (SRP)

## 📌 What is it?

A class should have **only one reason to change**. This means each class should handle exactly one responsibility—whether that's managing state, handling API calls, validating input, or logging data.

## 🤔 Why Does It Matter?

When a class has multiple responsibilities:
- **Hard to test** — Testing one feature might require setting up the entire class
- **Hard to maintain** — Changes to one feature can break another
- **Hard to reuse** — You can't use just one responsibility without dragging in the rest
- **Tight coupling** — Everything depends on everything

## ⚡ Problem vs Solution

### ❌ Problem: Too Many Responsibilities

```dart
class User {
  String name;
  String email;

  User(this.name, this.email);

  void saveUserToDatabase() {
    // Database logic
  }

  void showWelcomeMessage() {
    // UI logic
  }

  void showUserProfile(User user) {
  }
}
```

**Why is this bad?**
- User class handles 3 things: data storage, database persistence, UI presentation
- Need to change database logic? You modify User.
- Need to change UI? You modify User.
- Need to change data structure? You modify User.
- This class has 3 reasons to change!

### ✅ Solution: One Responsibility Per Class

```dart
// Responsibility 1: Represent user data
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

// Responsibility 2: Handle database operations
class UserRepository {
  void saveUserToDatabase(User user) {
    // Only database logic
  }
}

// Responsibility 3: Handle UI presentation
class UserView {
  void showWelcomeMessage(User user) {
    // Only UI logic
  }

void showUserProfile(User user) {
  }
}
```

**Why is this good?**
- **User** class has 1 job: hold user data
- **UserRepository** has 1 job: persist data
- **UserView** has 1 job: display data
- Each class has only 1 reason to change
- Easy to test, maintain, and reuse

## 🎯 When to Use SRP

✅ **Use SRP when:**
- A class is doing more than one thing
- Changes to one feature might break another
- You want to test features independently
- You need to reuse part of a class elsewhere

❌ **Don't over-apply SRP:**
- A class with one `toString()` method doesn't violate SRP
- Simple utility classes can have related methods
- Use common sense—balance clarity with practicality

## 💡 Real-World Examples

| Class | Should Handle | Should NOT Handle |
|-------|---------------|-------------------|
| `Logger` | Writing logs to console/file | Parsing configuration |
| `ApiClient` | Making HTTP requests | Parsing JSON (that's the Repository's job) |
| `User` | User data | Saving/loading (that's Repository's job) |
| `Validator` | Checking valid email/phone | Making API calls |

## 🚀 See It in Action

Run [main.dart](main.dart) to see a complete example with both ❌ bad and ✅ good implementations!

```bash
dart main.dart
```

## 📝 Key Takeaway

> "A class should have one reason to change."

Separate concerns. Each class should do one thing well. This makes your code simpler to understand, test, and maintain.


