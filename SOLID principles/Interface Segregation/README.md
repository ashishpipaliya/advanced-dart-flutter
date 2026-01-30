# Interface Segregation Principle (ISP)

## 📌 What is it?

Clients should not be forced to depend on interfaces they don't use. Split large interfaces into smaller, focused ones so implementers only have to provide what's relevant.

## ⚡ Short Example

### ❌ Bad (one large interface)
A printer that must also implement `scan` and `fax` even if it only prints leads to unimplemented methods or runtime errors.

### ✅ Good (segregated interfaces)
Provide `Printer`, `Scanner`, and `Fax` interfaces separately. A `SimplePrinter` implements only `Printer`; a `MultiFunctionPrinter` implements all three.

## 🚀 See It in Action
Run [main.dart](main.dart) to view a minimal, commented example demonstrating the difference.

```bash
dart main.dart
```

## 📝 Key Takeaway

> "Prefer many client-specific interfaces over one general-purpose interface."

Split interfaces by responsibility so classes only depend on what they actually use.
