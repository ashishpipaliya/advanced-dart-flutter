// State Pattern
// Allow an object to alter its behavior when its internal state changes.
// The object will appear to change its class.

// State interface
abstract class TrafficLightState {
  void next(TrafficLight light);
  void display();
}

// Concrete states
class RedLight implements TrafficLightState {
  @override
  void next(TrafficLight light) {
    light.setState(GreenLight());
  }

  @override
  void display() {
    print('🔴 Red Light - STOP');
  }
}

class GreenLight implements TrafficLightState {
  @override
  void next(TrafficLight light) {
    light.setState(YellowLight());
  }

  @override
  void display() {
    print('🟢 Green Light - GO');
  }
}

class YellowLight implements TrafficLightState {
  @override
  void next(TrafficLight light) {
    light.setState(RedLight());
  }

  @override
  void display() {
    print('🟡 Yellow Light - CAUTION');
  }
}

// Context: delegates state-specific behavior to the current state
class TrafficLight {
  late TrafficLightState _state;

  TrafficLight() {
    _state = RedLight(); // initial state
  }

  void setState(TrafficLightState state) {
    _state = state;
  }

  void change() {
    _state.next(this);
  }

  void show() {
    _state.display();
  }
}

void main() {
  print('=== State Pattern ===\n');

  final light = TrafficLight();

  // Display and transition through states
  for (var i = 0; i < 3; i++) {
    light.show();
    light.change();
  }

  print('\n📌 Key idea: The TrafficLight behavior changes based on its state.');
  print('   Each state encapsulates its own behavior; no long if/else chains.');
}


