# State Pattern

## 📌 What is it?

The State pattern allows an object to alter its behavior when its internal state changes. The object will appear to change its class.

## 🤔 When to use

- Objects with behavior that varies based on internal state
- Large conditional statements based on state
- State machines (traffic lights, order processing, authentication)
- Avoid bloated classes with multiple if/else branches

## ⚡ Example (Traffic Light)

- `TrafficLightState` — interface defining state-specific behavior
- `RedLight`, `GreenLight`, `YellowLight` — concrete states
- `TrafficLight` — context that delegates to the current state

Instead of a huge if/else in the context, each state handles its own logic.

## 🚀 Run the example

```bash
cd "Design patterns/State"
dart main.dart
```

## 📝 Key Takeaway

Use the State pattern to simplify code with multiple conditional branches based on object state. Each state encapsulates its behavior, making the code cleaner and easier to extend with new states.
