# SOLID Principles in Flutter

SOLID is a set of five design principles that help you write maintainable, scalable, and flexible code. These principles are crucial when building Flutter applications, as they ensure your codebase remains clean and testable as your project grows.

## Single Responsibility Principle (SRP)

A class should have only one reason to change. This means each class should handle exactly one responsibility—whether that's managing state, handling API calls, validating input, or logging data. When a class has multiple responsibilities, changes to one concern can break another. In Flutter, this translates to separating your business logic from your UI, and further breaking down business logic into focused services.

**Example Classes:**
- `Logger` — handles logging
- `Validator` — handles validation
- `ApiClient` — handles network requests
- `DatabaseService` — handles local storage
- `UserModel` — represents data structure

## Open/Closed Principle (OCP)

Classes should be open for extension but closed for modification. Instead of modifying existing code when you need new functionality, you should extend it. This is typically achieved through inheritance and abstract classes. When you need to add new behavior, create a subclass or implement a new version of an interface rather than changing the original class. This reduces the risk of breaking existing functionality.

**Example:**

| Base Class | Subclasses | New Feature |
|---|---|---|
| `PaymentGateway` | `CreditCardPayment`, `PayPalPayment`, `ApplePayPayment` | Add without modifying base |

## Liskov Substitution Principle (LSP)

If class B is a subclass of class A, you should be able to use B anywhere A is expected without breaking the application. In other words, derived classes must be substitutable for their base classes. This ensures that your abstractions work correctly—subclasses should honor the contracts defined by their parent classes. Violating this principle leads to unexpected behavior and hard-to-debug issues.

**Example:**

| Base | Subclasses | Contract |
|---|---|---|
| `User` | `AdminUser`, `GuestUser`, `PremiumUser` | All implement `getAge()` consistently |

Any subclass can be used wherever `User` is expected without breaking behavior.

## Interface Segregation Principle (ISP)

Clients should never be forced to depend on interfaces they don't use. Instead of having one large interface with many methods, split it into smaller, more specific interfaces. This way, classes only implement the methods they actually need. In Flutter, this means avoiding bloated abstract classes or interfaces that force implementations to provide unnecessary functionality.

**Example:**

| User Type | Interfaces Implemented |
|---|---|
| `GuestUser` | `Identifiable` |
| `StandardUser` | `Identifiable`, `Billable` |
| `PremiumUser` | `Identifiable`, `Billable`, `Refundable` |

Each user type only implements what it actually needs.

## Dependency Inversion Principle (DIP)

High-level modules should not depend on low-level modules; both should depend on abstractions. Rather than having your widgets or services depend on concrete implementations, they should depend on abstract classes or interfaces. This decouples your code and makes it easier to swap implementations, test components in isolation, and scale your application.

**Example:**

| Component | Depends On | Benefit |
|---|---|---|
| `LoginScreen` | `AuthService` (abstract) | Can swap Firebase ↔ Supabase |
| `AuthService` | Interface contract | Easy to test & extend |

---

These five principles work together to create a foundation for writing Flutter code that's easier to understand, test, modify, and extend.
