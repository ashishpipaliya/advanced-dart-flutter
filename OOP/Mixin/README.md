# Mixin

## 📌 What is it?

A mixin allows a class to reuse behavior from multiple sources without inheriting from them.
Mixins provide horizontal code reuse, avoiding deep or multiple inheritance.
In Dart, mixins provide horizontal code reuse and are applied using the with keyword.

## ⚡ Example

Different classes reuse logging behavior by mixing in a common Logger mixin, without becoming subclasses of Logger.

## Types of mixins
- Basic Mixins (normal mixin)
    - Provide reusable behavior without constraints.


- Constrained Mixins (on keyword)
    - Restrict which classes can use the mixin.

## 🚀 Run the example

```bash
cd "OOP/Polymorphism"
dart main.dart
```
