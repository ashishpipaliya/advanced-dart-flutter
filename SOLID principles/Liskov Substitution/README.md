# Liskov Substitution Principle (LSP)

## 📌 What is it?

Subclasses must be substitutable for their base classes — a subclass should work anywhere the parent is expected without breaking behavior.

## ⚡ Vehicle example (concise)

### ❌ Bad design

When a wide `Vehicle` interface requires `refuel()` for all vehicles, you force electric vehicles to implement `refuel()` (mapping to charging). That mixes concerns and can confuse clients.

### ✅ Good design

Split responsibilities:
- `BaseVehicle` for `move()`
- `FuelVehicle` for `refuel()`
- `ElectricVehicle` for `charge()`

Service functions now accept the appropriate abstraction (`FuelVehicle` or `ElectricVehicle`) so implementations don't fake or violate behavior.

## 🚀 Run the example

```bash
dart main.dart
```

## 📝 Key Takeaway

If a subtype cannot honor the parent's contract, don't inherit from it — use separate interfaces or composition.
