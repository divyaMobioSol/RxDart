import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rx_app/controller.dart';

class MyhomePage extends StatelessWidget {
  CounterBloc counterBloc = CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDart')),
      body: Column(
        children: [
          Center(
            child: StreamBuilder<Object>(
                stream: counterBloc.counterObservable,
                builder: (context, snapshot) {
                  return Text(snapshot.data.toString());
                }),
          ),
          Row(
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
          )
        ],
      ),
    );
  }
}
