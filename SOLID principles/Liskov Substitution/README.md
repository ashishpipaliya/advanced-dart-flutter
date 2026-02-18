# Liskov Substitution Principle (LSP)

## 📌 What is it?

If class B extends class A, then we should be able to use B anywhere A is expected — without breaking the app’s behavior.

👉 In short:

A child class should behave like its parent class.

---

## ❌ Example of LSP Violation (Wrong Way)

Let’s say we design a `Bird` interface:

```dart
abstract class Bird {
  void fly();
}
```

Now we create:

```dart
class Sparrow implements Bird {
  @override
  void fly() {
    print("Flying...");
  }
}

class Penguin implements Bird {
  @override
  void fly() {
    throw Exception("Penguins can't fly!");
  }
}
```

### 🚨 Problem

If somewhere in Flutter code we have a function like this:

```dart
void makeBirdFly(Bird bird) {
  bird.fly();
}
```

Calling it with a Penguin:

```dart
makeBirdFly(Penguin()); // 💥 App crashes
```

**Why?**
Because `Penguin` is not truly substitutable for `Bird`. This breaks LSP.

---

## ✅ Correct Way (Follow LSP)

Instead of forcing all birds to fly, split responsibilities.

```dart
abstract class Bird {}

abstract class FlyingBird implements Bird {
  void fly();
}
```

Now:

```dart
class Sparrow implements FlyingBird {
  @override
  void fly() {
    print("Sparrow flying");
  }
}

class Penguin implements Bird {}
```

Now this works safely:

```dart
void makeBirdFly(FlyingBird bird) {
  bird.fly();
}
```

`Penguin` is no longer misused because the compiler won't even let you pass it to `makeBirdFly`.

✔ **No crashes**  
✔ **Clean architecture**  
✔ **Safer polymorphism**

---

## 🚀 Run the example

```bash
dart main.dart
```
