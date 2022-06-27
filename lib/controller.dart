import 'package:rxdart/rxdart.dart';

class CounterBloc {
  List<int> cart = [];

  int initialCount;

  BehaviorSubject<int>? behaviorSubject;

  CounterBloc({required this.initialCount}) {
    behaviorSubject = new BehaviorSubject.seeded(this.initialCount);
  }

  ValueStream<int> get counterObservable => behaviorSubject!.stream;

  void increment() {
    initialCount++;
    cart.add(initialCount);
    print('addcart' + '$cart');
    behaviorSubject!.sink.add(initialCount);
  }

  void decrement() {
    initialCount--;
    cart.remove(initialCount);
    behaviorSubject!.sink.add(initialCount);
  }

  void reset() {
    initialCount = 0;
    cart.clear();
    print(cart);
    behaviorSubject!.sink.add(initialCount);
  }

  void dispose() {
    behaviorSubject!.close();
  }
}
