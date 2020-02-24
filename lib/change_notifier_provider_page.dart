import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderPage extends StatefulWidget {

  @override
  _ChangeNotifierProviderPageState createState() =>
      _ChangeNotifierProviderPageState();
}

class _ChangeNotifierProviderPageState
    extends State<ChangeNotifierProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierProvider'),
      ),
      body: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Consumer<Counter>(
                builder: (context, counter, child){
                  return Text("${counter.count}");
                },
              ),
              Consumer<Counter>(
                builder: (context, counter, child){
                  return FlatButton(
                    onPressed: () => counter.increment(),
                    child: Text("add"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
//      body: ChangeNotifierProvider<Counter>.value(
//        value: Counter(),
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Consumer<Counter>(
//                builder: (context, counter, child){
//                  return Text("${Provider.of<Counter>(context).count}");
//                },
//              ),
//              Consumer<Counter>(
//                builder: (context, counter, child){
//                  return FlatButton(
//                    onPressed: () => counter.increment(),
//                    child: Text("add"),
//                  );
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
