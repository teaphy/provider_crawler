import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueListenableProviderPage extends StatefulWidget {
  @override
  _ValueListenableProviderPageState createState() =>
      _ValueListenableProviderPageState();
}

class _ValueListenableProviderPageState
    extends State<ValueListenableProviderPage> {
  @override
  Widget build(BuildContext context) {
    var _counter = Counter(0);

    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ValueListenableProvider<int>(
              create: (context) => _counter,
              child: Consumer<int>(
                builder: (context, counter, child){
                  return Text("$counter");
                },
              ),
            ),
            FlatButton(
              onPressed: () => _counter.increment(),
              child: Text("add"),
            )
          ],
        ),
      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            ValueListenableProvider<int>.value(
//              value: _counter,
//              child: Consumer<int>(
//                builder: (context, counter, child) {
//                  return Text("$counter");
//                },
//              ),
//            ),
//            FlatButton(
//              onPressed: () => _counter.increment(),
//              child: Text("add"),
//            )
//          ],
//        ),
//      ),
    );
  }
}

class Counter extends ValueNotifier<int> {
  Counter(int value) : super(value);

  void increment() {
    ++value;
  }
}
