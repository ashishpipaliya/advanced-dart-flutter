// Single Responsibility Principle (SRP)
// Each class should have only ONE reason to change

// ❌ BAD: User class has THREE responsibilities
// - Storing user data
// - Saving to database
// - Displaying UI messages
// If any of these needs to change, we have to modify the User class!

class UserBad {
  String name;
  String email;

  UserBad(this.name, this.email);

  // Responsibility 1: Save to database
  void saveUserToDatabase() {
    print('Saving $name to database...');
    // Database logic here
  }

  // Responsibility 2: Show UI message
  void showWelcomeMessage() {
    print('Welcome, $name!');
  }
}

// ✅ GOOD: Each class has ONE responsibility and ONE reason to change

// Responsibility 1: Represent user data only
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  @override
  String toString() => 'User(name: $name, email: $email)';
}

// Responsibility 2: Handle database operations
class UserRepository {
  void saveUserToDatabase(User user) {
    print('💾 Saving $user to database...');
    // Database logic here
  }

  User? getUserFromDatabase(String email) {
    print('📖 Fetching user $email from database...');
    // Return user from database
    return null;
  }
}

// Responsibility 3: Handle UI display
class UserView {
  void showWelcomeMessage(User user) {
    print('👋 Welcome, ${user.name}!');
  }

  void showUserProfile(User user) {
    print('📋 User Profile:');
    print('   Name: ${user.name}');
    print('   Email: ${user.email}');
  }
}

void main() {
  print('=== Single Responsibility Principle ===\n');

  // Create a user
  final user = User(name: 'Alice', email: 'alice@example.com');

  // Different parts of the system handle different responsibilities
  final repository = UserRepository();
  final view = UserView();

  // Save to database
  repository.saveUserToDatabase(user);

  // Show UI
  view.showWelcomeMessage(user);
  view.showUserProfile(user);

  print('\n✅ Each class has ONE job:');
  print('   • User → Holds data');
  print('   • UserRepository → Handles database');
  print('   • UserView → Handles UI');
  print('\n📌 Benefits:');
  print('   • Easy to test (mock each responsibility separately)');
  print('   • Easy to change (modify only the relevant class)');
  print('   • Easy to reuse (use User class anywhere)');
}
