// Open/Closed Principle (OCP)
// Software entities should be OPEN for extension but CLOSED for modification

// ❌ BAD: We have to modify the PaymentProcessor class every time we add a new payment method
// Violates OCP because we're modifying existing code instead of extending it

class PaymentProcessorBad {
  void processPayment(String method, double amount) {
    if (method == 'creditCard') {
      print('💳 Processing credit card payment: \$$amount');
      // Credit card logic
    } else if (method == 'paypal') {
      print('🅿️ Processing PayPal payment: \$$amount');
      // PayPal logic
    } else if (method == 'applepay') {
      print('🍎 Processing Apple Pay payment: \$$amount');
      // Apple Pay logic
    }
    // Every new payment method requires modifying this class!
  }
}

// ✅ GOOD: Use abstraction/interfaces to make it extensible
// The processor is CLOSED for modification but OPEN for extension

// Abstract base class - defines the contract
abstract class PaymentMethod {
  void process(double amount);
}

// Concrete implementations - extend without modifying processor
class CreditCardPayment implements PaymentMethod {
  @override
  void process(double amount) {
    print('💳 Processing credit card payment: \$$amount');
    // Credit card specific logic
  }
}

class PayPalPayment implements PaymentMethod {
  @override
  void process(double amount) {
    print('🅿️ Processing PayPal payment: \$$amount');
    // PayPal specific logic
  }
}

class ApplePayPayment implements PaymentMethod {
  @override
  void process(double amount) {
    print('🍎 Processing Apple Pay payment: \$$amount');
    // Apple Pay specific logic
  }
}

// New payment method? Just create a new class - no modification needed!
class CryptoPayment implements PaymentMethod {
  @override
  void process(double amount) {
    print('₿ Processing Crypto payment: \$$amount');
    // Crypto specific logic
  }
}

// Processor is CLOSED for modification
// It doesn't change when new payment methods are added
class PaymentProcessor {
  void processPayment(PaymentMethod method, double amount) {
    method.process(amount);
    // That's it! Works with ANY payment method!
  }
}

void main() {
  print('=== Open/Closed Principle ===\n');

  final processor = PaymentProcessor();

  // Existing payment methods
  final creditCard = CreditCardPayment();
  final paypal = PayPalPayment();
  final applePay = ApplePayPayment();

  // Process payments
  processor.processPayment(creditCard, 50.0);
  processor.processPayment(paypal, 100.0);
  processor.processPayment(applePay, 75.0);

  // Adding new payment method WITHOUT modifying PaymentProcessor!
  final crypto = CryptoPayment();
  processor.processPayment(crypto, 0.5);

  print('\n✅ Open/Closed in Action:');
  print('   • Added CryptoPayment WITHOUT modifying PaymentProcessor');
  print('   • Processor is CLOSED for modification');
  print('   • But OPEN for extension via new payment methods');

  print('\n📌 Benefits:');
  print('   • Easy to add new features (create new classes)');
  print('   • No need to change existing, tested code');
  print('   • Less risk of breaking existing functionality');
  print('   • Better maintainability and scalability');
}
