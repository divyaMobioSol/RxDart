import 'package:flutter/material.dart';
import 'package:rx_app/controller.dart';

class MyhomePage extends StatelessWidget {
  CounterBloc counterBloc = CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDart')),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.increment();
              },
              child: Text('1+'),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.decrement();
              },
              child: Text("1-"),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.reset();
              },
              child: Icon(Icons.recycling),
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: StreamBuilder<Object>(
            stream: counterBloc.counterObservable,
            builder: (context, snapshot) {
              return Text(
                'Counter ${snapshot.data}',
                style: const TextStyle(fontSize: 25),
              );
            }),
      ),
    );
  }
}
