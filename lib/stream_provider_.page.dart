import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderPage extends StatefulWidget {
  @override
  _StreamProviderPageState createState() => _StreamProviderPageState();
}

class _StreamProviderPageState extends State<StreamProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamProvider'),
      ),
//      body: StreamProvider<int>(
//        create: (context) => timedCounter(Duration(seconds: 1), 60),
//        initialData: 60,
//        child: Center(
//          child: Consumer<int>(
//            builder: (context, countDown, _){
//              return Text('$countDown s');
//            },
//          ),
//        ),
//      ),
      body: StreamProvider<int>.value(
        value: timedCounter(Duration(seconds: 1), 60),
        initialData: 60,
        child: Center(
          child: Consumer<int>(
            builder: (context, countDown, _) {
              return Text('$countDown s');
            },
          ),
        ),
      ),
    );
  }

  Stream<int> timedCounter(Duration interval, [int maxCount]) async* {
    int max = maxCount ?? 60;
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield max - i;
      i++;
      if (i > maxCount) break;
    }
  }
}
