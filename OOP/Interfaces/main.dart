abstract class Notifier {
  void notify(String message);
}

class EmailNotifier implements Notifier {
  final String email;
  EmailNotifier(this.email);

  @override
  void notify(String message) {
    print('Sending email to $email: $message');
  }
}

class SmsNotifier implements Notifier {
  final String phone;
  SmsNotifier(this.phone);

  @override
  void notify(String message) {
    print('Sending SMS to $phone: $message');
  }
}

void sendNotifications(List<Notifier> notifiers, String message) {
  for (var n in notifiers) n.notify(message);
}

void main() {
  print('=== Interfaces (implements) ===');
  final list = [
    EmailNotifier('alice@example.com'),
    SmsNotifier('+1234567890'),
  ];
  sendNotifications(list, 'Hello from the interface demo!');
}
