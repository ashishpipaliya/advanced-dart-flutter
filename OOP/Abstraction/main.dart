abstract class PaymentMethod {
  // Abstract property (getter) — subclasses must provide this
  String get providerName;

  // Abstract method — subclasses must implement
  void pay(double amount);

  // Concrete method — shared behavior provided by the abstract class
  void info() {
    print('Using payment provider: $providerName');
  }
}

class CreditCard extends PaymentMethod {
  final String card;
  CreditCard(this.card);

  @override
  String get providerName => 'Credit Card ($card)';

  @override
  void pay(double amount) {
    print('Charging \$${amount.toStringAsFixed(2)} to card $card');
  }
}

class PayPal extends PaymentMethod {
  final String account;
  PayPal(this.account);

  @override
  String get providerName => 'PayPal ($account)';

  @override
  void pay(double amount) {
    print('Charging \$${amount.toStringAsFixed(2)} to PayPal $account');
  }
}

void checkout(PaymentMethod method, double amount) {
  // Call concrete method defined on the abstract class
  method.info();
  method.pay(amount);
}

// Example showing `implements` requires re-implementing concrete method `info()`
class PaymentImplementer implements PaymentMethod {
  final String name;
  PaymentImplementer(this.name);

  @override
  String get providerName => name;

  @override
  void pay(double amount) {
    print('PaymentImplementer charging \$${amount.toStringAsFixed(2)} via $name');
  }

  // Because we `implements` PaymentMethod, we must provide `info()` ourselves
  @override
  void info() {
    print('IMPLEMENTED info() for $providerName');
  }
}

void main() {
  print('=== Abstraction ===');

  // Using subclasses that `extends` the abstract class: they inherit `info()`
  checkout(CreditCard('4111-xxxx-xxxx-1111'), 49.99);
  checkout(PayPal('alice@pay'), 19.99);

  print('\n--- Demonstrating `implements` (must redefine concrete members) ---');

  final impl = PaymentImplementer('ImplPay');
  checkout(impl, 9.99);
}
