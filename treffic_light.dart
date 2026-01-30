import 'dart:async';

void main() {
  StreamController<TrafficLight> _trafficLightController = StreamController<TrafficLight>();

  int timeoutSeconds = 5;
  int _currentLightIndex = 0;
  _trafficLightController.stream.listen((event) => print("${event} : ${timeoutSeconds}"));

  // Print initial state immediately
  _trafficLightController.sink.add(TrafficLight.values[_currentLightIndex]);

  Timer.periodic(Duration(seconds: 1), (timer) {
    if (timeoutSeconds > 1) {
      timeoutSeconds--;
      _trafficLightController.sink.add(TrafficLight.values[_currentLightIndex]);
    } else {
      timeoutSeconds = 5;
      _currentLightIndex = (_currentLightIndex + 1) % TrafficLight.values.length;
      _trafficLightController.sink.add(TrafficLight.values[_currentLightIndex]);
    }
  });
}

enum TrafficLight { red, yellow, green }
