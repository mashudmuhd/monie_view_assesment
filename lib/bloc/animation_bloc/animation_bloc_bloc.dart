import 'dart:async';
part 'animation_bloc_event.dart';
part 'animation_bloc_state.dart';

class AnimationBloc {
  // Initial state of the animation
  AnimationState _state = AnimationState();

  // Stream controllers
  final _stateStreamController = StreamController<AnimationState>();
  final _eventStreamController = StreamController<AnimationEvent>();

  Stream<AnimationState> get stateStream => _stateStreamController.stream;
  Sink<AnimationEvent> get eventSink => _eventStreamController.sink;

  // Constructor: Listen to events and handle them
  AnimationBloc() {
    _eventStreamController.stream.listen(_handleEvent);
  }

  // Method to handle incoming events and update the state
  void _handleEvent(AnimationEvent event) {
    if (event == AnimationEvent.toggle) {
      _state = AnimationState(isOpened: !_state.isOpened);
      _stateStreamController.sink.add(_state); 
    }
  }

  // Dispose method: Close stream controllers to prevent memory leaks
  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}

