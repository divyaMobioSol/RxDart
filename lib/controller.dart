import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int initialCount = 0;

  BehaviorSubject<int>? behaviorSubject;

  CounterBloc({required this.initialCount}) {
    behaviorSubject = new BehaviorSubject.seeded(this.initialCount);
  }

  ValueStream<int> get counterObservable => behaviorSubject!.stream;

  void increment() {
    initialCount++;
    behaviorSubject!.sink.add(initialCount);
  }

  void decrement() {
    initialCount--;
    behaviorSubject!.sink.add(initialCount);
  }

  void reset() {
    initialCount = 0;
    behaviorSubject!.sink.add(initialCount);
  }

  void dispose() {
    behaviorSubject!.close();
  }
}
