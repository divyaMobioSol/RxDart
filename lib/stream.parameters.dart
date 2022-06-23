import 'dart:async';

import 'package:rxdart/rxdart.dart';

_learnStream() async {
  //var subject = StreamController.broadcast();

//* PublishSubject
  ///PublishSubject will add item 1,2,3,4 all are added in 1st stream, but in case of 2ndstresm it can only add item 3,4.
  //jus because item 3,4 are called after 2ns stream.

//*BehaviorSubject
  ///BehaviorSubject will add item 1,2,3,4 all are added in 1st stream, but in case of 2ndstresm it can only add item 2, 3,4.
  ///It can also add last event before the subscription.

//*ReplaySubject
  ///ReplaySubject will add item 1,2,3,4 all are added in 1st stream, but in case of 2ndstresm it can only add item 1,2, 3,4.
  ///It can also add all the events that are called before subscription.

  var subject = PublishSubject<String>();
  // var subject = BehaviorSubject<String>();
  // var subject = ReplaySubject<String>();

  subject.listen((value) {
    print('Added $value to 1st Stream');
  });

  subject
      .map((event) => event.toUpperCase())
      .map((event) => event.substring(event.length - 1))
      .map((event) => num.tryParse(event)).


///will eliminates all other which subscribed before 3...result only item4 will b added.
     // debounceTime(Duration(seconds: 3))

     //which will added in pair like 2 , 2 items at a time [1,2], [3,4]
//bufferCount(2)


//will add items like [1,2], [2,3,4] after every 2 seconds.. 
//bufferTime(Duration(seconds: 2))


//if the stream is empty then add item 100 to the list...
//defaultIfEmpty(100)

      ///*will add items adding format like 1, 3, 6
      //scan((a, b, index) => a! + b, 1)


//which adds the item which is already subscribed, like [1.2], [2,3]. [3,4]
pairwise()


      ///will return only the even number item.
      //where((event) => (event! % 2) == 0)
      .listen((value) {
    print('Added ${value.runtimeType} to 1st Stream');
  });

////will return 1,2,3 instead of string type converted to int type.






  subject.add("item 1");
  subject.add("item 2");


  RangeStream(1,5).
  switchMap((value) => TimerStream(value, Duration(seconds: value))).
  listen((value) {
    print('Added $value to 2st Stream');
  });
//will print like [1,2,3,4,5].. 
//switchMap will return the last item which is subscribed... [5]


  subject.add("item 3");
  subject.add("item 4");
}
