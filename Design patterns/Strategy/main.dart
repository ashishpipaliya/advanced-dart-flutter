// Strategy Pattern
// Define a family of algorithms, encapsulate each one, and make them interchangeable.

// Strategy interface
abstract class PaymentStrategy {
  void pay(double amount);
}

// Concrete strategies
class CreditCardPayment implements PaymentStrategy {
  final String cardNumber;

  CreditCardPayment(this.cardNumber);

  @override
  void pay(double amount) {
    print('💳 Paying \$$amount with Credit Card ending in ${cardNumber.substring(cardNumber.length - 4)}');
  }
}

class PayPalPayment implements PaymentStrategy {
  final String email;

  PayPalPayment(this.email);

  @override
  void pay(double amount) {
    print('🅿️ Paying \$$amount via PayPal ($email)');
  }
}

class CryptoPayment implements PaymentStrategy {
  final String walletAddress;

  CryptoPayment(this.walletAddress);

  @override
  void pay(double amount) {
    print('₿ Paying \$$amount with Crypto to $walletAddress');
  }
}

// Context: uses a strategy to perform the payment
class ShoppingCart {
  late PaymentStrategy paymentMethod;
  double total = 0;

  void addItem(double price) {
    total += price;
  }

  void setPaymentMethod(PaymentStrategy strategy) {
    paymentMethod = strategy;
  }

  void checkout() {
    if (total > 0) {
      paymentMethod.pay(total);
    }
  }
}

void main() {
  print('=== Strategy Pattern ===\n');

  final cart = ShoppingCart();
  cart.addItem(29.99);
  cart.addItem(15.50);

  // Use credit card strategy
  cart.setPaymentMethod(CreditCardPayment('1234-5678-9012-3456'));
  cart.checkout();

  // Switch to PayPal strategy
  final cart2 = ShoppingCart();
  cart2.addItem(49.99);
  cart2.setPaymentMethod(PayPalPayment('user@example.com'));
  cart2.checkout();

  // Switch to crypto strategy
  final cart3 = ShoppingCart();
  cart3.addItem(100.00);
  cart3.setPaymentMethod(CryptoPayment('0x123abc...'));
  cart3.checkout();

  print('\n📌 Key idea: The ShoppingCart (context) doesn\'t care HOW payment is made.');
  print('   It delegates to the strategy; new strategies can be added without changing ShoppingCart.');
}
