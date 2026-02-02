# Singleton Pattern

## 📌 What is it?

The Singleton pattern ensures a class has only one instance and provides a global access point to it.

## 🤔 When to use

- Managing shared resources (e.g., logging, configuration, connection pool)
- When exactly one instance of a class is needed throughout the app

## ⚠️ Caution

Use sparingly — singletons are effectively global state and can make testing harder if overused.

## ⚡ Example (simple)

- ❌ Bad: Regular classes let multiple instances be created accidentally.
- ✅ Good: Use a private constructor and a factory that returns a single static instance.
 - ✅ Good: Use a private constructor and a factory that returns a single static instance.
 - ✅ Lazy variant: create the single instance when first requested to avoid startup cost.

Run the example:

```bash
cd "Design patterns/Singleton"
dart main.dart
```

## 📝 Key Takeaway

Singletons control instance creation; prefer dependency injection when possible for better testability.

## Examples included

- `Logger` — eager singleton (instance created at class load)
- `LazyLogger` — lazy singleton (instance created on first access)
