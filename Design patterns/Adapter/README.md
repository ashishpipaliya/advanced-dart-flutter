# Adapter Pattern

## 📌 What is it?

The Adapter pattern converts the interface of an existing class into another interface that clients expect. It acts like a bridge between incompatible interfaces without modifying the original code.

## 🤔 When to use

- Integrating legacy systems with new code
- Working with third-party libraries with incompatible interfaces
- Reusing classes that have incompatible interfaces
- Need to make a class work with an existing interface

## ⚡ Example (Shareholder Adapter)

- `LegacyShareholder` — old system we can't change (different method names)
- `ShareholderData` — modern interface our app expects
- `ShareholderAdapter` — bridges the gap between old and new

Old system uses `getName()`, `getShares()`, `getInvestment()`  
New app expects `getFullInfo()`, `getShareValue()`

The adapter converts legacy shareholder data to modern interface:

```dart
final legacyShareholder = LegacyShareholder('John', 150, 15000.0);
final adapter = ShareholderAdapter(legacyShareholder, 85.50);

// Now works with modern interface
print(adapter.getFullInfo());      // "John holds 150 shares"
print(adapter.getShareValue());    // 12825.0
```

## 🚀 Run the example

```bash
cd "Design patterns/Adapter"
dart main.dart
```

## 📝 Key Takeaway

Use the Adapter pattern when you need to make incompatible interfaces work together. It's essential for integrating legacy systems, third-party libraries, or when you can't modify existing code but need a different interface.
