import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectorPage extends StatefulWidget {
  @override
  _SelectorPageState createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
        create: (context) => _counter,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Selector'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Consumer<Counter>(
                  builder: (context, counter, child) {
                    print("Consumer ---> count1: ${counter.count1}");
                    return Column(
                      children: <Widget>[
                        Text("consume --> count1: ${counter.count1}"),
                      ],
                    );
                  },
                ),
                Consumer<Counter>(
                  builder: (context, counter, child) {
                    print("Consumer ---> count2: ${counter.count2}");
                    return Column(
                      children: <Widget>[
                        Text("consume --> count2: ${counter.count2}")
                      ],
                    );
                  },
                ),
                Selector<Counter, int>(
                  builder: (_, counter, __) {
                    print("selector ---> count1: $counter");
                    return Text('selector ---> count1: $counter');
                  },
                  // selector返回具体的值，返回的值必须继承自==而且不能为null
                  selector: (context, counter) {
                    return counter.count1;
                  },
                ),
                Selector<Counter, int>(
                  builder: (_, counter, __) {
                    print("selector ---> count2: $counter");
                    return Text('selector ---> count2: $counter');
                  },
                  // selector返回具体的值，返回的值必须继承自==而且不能为null
                  selector: (context, counter) {
                    return counter.count2;
                  },
                ),
                Consumer<Counter>(
                  builder: (context, counter, child) {
                    return FlatButton(
                      onPressed: () => counter.increment1(),
                      child: Text("add1"),
                    );
                  },
                ),
                Consumer<Counter>(
                  builder: (context, counter, child) {
                    return FlatButton(
                      onPressed: () => counter.increment2(),
                      child: Text("add2"),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class Counter with ChangeNotifier {
  int _count1 = 0;
  int _count2 = 0;

  int get count1 => _count1;

  int get count2 => _count2;

  void increment1() {
    _count1++;
    notifyListeners();
  }

  void increment2() {
    _count2++;
    notifyListeners();
  }
}
