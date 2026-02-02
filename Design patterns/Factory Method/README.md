# Factory Method Pattern

## 📌 What is it?

The Factory Method defines an interface for creating an object, but lets subclasses decide which class to instantiate. It lets a class defer instantiation to subclasses.

## 🤔 When to use

- When a class can't anticipate the type of objects it needs to create
- When subclasses should specify the objects they create
- To localize knowledge of which concrete classes are used

## ⚡ Example (Buttons & Dialogs)

- `Button` — product interface
- `WindowsButton` / `MacButton` — concrete products
- `Dialog` — creator with factory method `createButton()`
- `WindowsDialog` / `MacDialog` — concrete creators overriding `createButton()`

The client calls `dialog.renderWindow()` which uses the factory method to obtain a `Button`.

## 🚀 Run the example

```bash
cd "Design patterns/Factory Method"
dart main.dart
```

## 📝 Key Takeaway

Use the Factory Method to decouple code that needs objects from the concrete classes that instantiate them. This makes code more flexible and easier to extend.

## 🧭 Dart tip: `factory` constructor as a simple factory

In Dart you can use the `factory` constructor to implement a small factory that returns different concrete implementations based on input. This is handy for quick dispatch without creating a separate Creator subclass.

Example:

```dart
abstract class Dialog {
	factory Dialog(String os) {
		if (os == 'mac') return MacDialog();
		return WindowsDialog();
	}

	void renderWindow();
}

class WindowsDialog implements Dialog {
	@override
	void renderWindow() => print('Windows dialog');
}

class MacDialog implements Dialog {
	@override
	void renderWindow() => print('macOS dialog');
}

// Usage:
// final dialog = Dialog(Platform.isMacOS ? 'mac' : 'win');
// dialog.renderWindow();
```

This approach is concise and Dart-idiomatic; use it when the selection logic is simple. For more complex creation logic or extensibility, prefer the classic Factory Method with separate Creator subclasses.
