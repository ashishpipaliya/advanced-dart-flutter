// Observer Pattern
// Define a one-to-many dependency between objects so that when one object changes state,
// all its dependents are notified automatically.

// Observer interface
abstract class Observer {
  void update(String message);
}

// Concrete observers
class EmailSubscriber implements Observer {
  final String email;

  EmailSubscriber(this.email);

  @override
  void update(String message) {
    print('📧 Email to $email: $message');
  }
}

class SMSSubscriber implements Observer {
  final String phone;

  SMSSubscriber(this.phone);

  @override
  void update(String message) {
    print('📱 SMS to $phone: $message');
  }
}

// Subject: the object being observed
class NewsChannel {
  final List<Observer> _subscribers = [];

  void subscribe(Observer observer) {
    _subscribers.add(observer);
  }

  void unsubscribe(Observer observer) {
    _subscribers.remove(observer);
  }

  void publishNews(String headline) {
    print('📰 Publishing: $headline');
    // Notify all observers
    for (final observer in _subscribers) {
      observer.update(headline);
    }
  }
}

void main() {
  print('=== Observer Pattern ===\n');

  final newsChannel = NewsChannel();

  // Create observers
  final emailSub = EmailSubscriber('user@example.com');
  final smsSub = SMSSubscriber('+1234567890');

  // Subscribe to the channel
  newsChannel.subscribe(emailSub);
  newsChannel.subscribe(smsSub);

  // Publish a story
  newsChannel.publishNews('Breaking News: Dart 4.0 Released!');

  print('\n--- Unsubscribe SMS ---');
  newsChannel.unsubscribe(smsSub);

  // Publish another story
  newsChannel.publishNews('New Flutter Features Available');

  print('\n📌 Key idea: The subject notifies all observers automatically.');
  print('   Observers can be added/removed without modifying the subject.');
}
