// Factory Method Pattern
// Define an interface for creating an object, but let subclasses decide which class to instantiate.

// Product interface
abstract class Button {
  void render();
}

// Concrete products
class WindowsButton implements Button {
  @override
  void render() {
    print('Rendering Windows-style button');
  }
}

class MacButton implements Button {
  @override
  void render() {
    print('Rendering macOS-style button');
  }
}

// Creator (abstract) declares the factory method
abstract class Dialog {
  Button createButton(); // factory method

  // Business logic uses the product via its interface
  void renderWindow() {
    final button = createButton();
    // client code works with the Button interface
    button.render();
  }
}

// Concrete Creators override the factory method to return different products
class WindowsDialog extends Dialog {
  @override
  Button createButton() {
    return WindowsButton();
  }
}

class MacDialog extends Dialog {
  @override
  Button createButton() {
    return MacButton();
  }
}

void main() {
  print('=== Factory Method Pattern ===\n');

  // Choose a concrete creator at runtime (e.g., based on config or platform)
  Dialog dialog;
  final isMac = false; // flip to true to simulate macOS

  if (isMac) {
    dialog = MacDialog();
  } else {
    dialog = WindowsDialog();
  }

  // The client uses the creator; the concrete product is created inside.
  dialog.renderWindow();

  print("\n📌 Key idea: the factory method encapsulates object creation so the client code depends only on abstractions (Button), not concrete classes.");
}
