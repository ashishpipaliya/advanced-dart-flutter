// Singleton Pattern
// Ensure a class has only one instance and provide a global access point.

// ❌ BAD: Using global variables or uncontrolled constructors
class LoggerBad {
	// Multiple instances can be created accidentally
	void log(String message) {
		print('[LOG] $message');
	}
}

// ✅ GOOD: Dart singleton using a private constructor and a static instance
class Logger {
	Logger._internal(); // private named constructor

	static final Logger _instance = Logger._internal();

	factory Logger() => _instance; // factory returns the same instance

	void log(String message) {
		print('[Singleton LOG] $message');
	}
}

// ✅ LAZY Singleton: instance created when first requested
class LazyLogger {
	LazyLogger._internal();

	static LazyLogger? _instance;

	factory LazyLogger() {
		_instance ??= LazyLogger._internal();
		return _instance!;
	}

	void log(String message) {
		print('[Lazy Singleton LOG] $message');
	}
}

void main() {
	print('=== Singleton Pattern ===\n');

	// BAD: multiple instances
	final bad1 = LoggerBad();
	final bad2 = LoggerBad();
	print('bad1 == bad2: ${bad1 == bad2}');
	bad1.log('first');

	// GOOD: same instance
	final logger1 = Logger();
	final logger2 = Logger();
	print('logger1 == logger2: ${logger1 == logger2}');
	logger1.log('app started');

	// LAZY: instance is created on first access
	final lazy1 = LazyLogger();
	final lazy2 = LazyLogger();
	print('lazy1 == lazy2: ${lazy1 == lazy2}');
	lazy1.log('lazy initialized');
}
