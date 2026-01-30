// Dependency Inversion Principle (DIP) — Null-safe example
// High-level modules should depend on abstractions, not concrete implementations.

// Abstraction
abstract class Notifier {
  void send(String message);
}


// Low-level implementations
class EmailNotifier implements Notifier {
  @override
  void send(String message) {
    print('📧 Email sent: $message');
  }
}

class SmsNotifier implements Notifier {
  @override
  void send(String message) {
    print('📩 SMS sent: $message');
  }
}

// High-level module depends on the abstraction `Notifier`.
// The constructor requires a non-nullable `Notifier` — callers must inject it.
class UserRegistration {
  final Notifier notifier; // non-nullable inside the class

  // Require a concrete Notifier to be provided. This keeps the API explicit
  // and avoids hidden fallbacks.
  UserRegistration({required this.notifier});

  void register(String username) {
    print('Registering user: $username');
    notifier.send('Welcome, $username!');
  }
}

void main() {
  print('=== Dependency Inversion Principle (null-safe) ===\\n');

  // Passing a concrete implementation
  final emailReg = UserRegistration(notifier: EmailNotifier());
  emailReg.register('Alice');

  // Passing another concrete implementation
  final smsReg = UserRegistration(notifier: SmsNotifier());
  smsReg.register('Bob');

  // The notifier is required; callers must provide a concrete implementation.
  // This avoids hidden no-op behavior and makes dependencies explicit.

  print('\\n📌 DIP Rule (null-safe): High-level and low-level modules depend on abstractions; null inputs are handled safely.');
}
