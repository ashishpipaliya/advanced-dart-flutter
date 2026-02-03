class BankAccount {
  double _balance = 0.0;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) throw ArgumentError('Amount must be positive');
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) throw ArgumentError('Amount must be positive');
    if (amount > _balance) throw StateError('Insufficient funds');
    _balance -= amount;
  }
}

void main() {
  print('=== Encapsulation ===');
  final acct = BankAccount();
  acct.deposit(100);
  print('Balance: \$${acct.balance}');
  acct.withdraw(30);
  print('Balance after withdrawal: \$${acct.balance}');
}
