import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProxyProviderPage extends StatefulWidget {
  @override
  _ChangeNotifierProxyProviderPageState createState() =>
      _ChangeNotifierProxyProviderPageState();
}

class _ChangeNotifierProxyProviderPageState
    extends State<ChangeNotifierProxyProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierProxyProvider'),
      ),
      body: Column(
        children: <Widget>[
          ChangeNotifierProvider<Counter>(
            create: (context) => Counter(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Consumer<Counter>(
                    builder: (context, counter, child){
                      return Text("点击次数：${counter.count}");
                    },
                  ),
                  Consumer<Counter>(
                    builder: (context, counter, child){
                      return FlatButton(
                        onPressed: () => counter.increment(),
                        child: Text("click"),
                      );
                    },
                  ),
                  ChangeNotifierProxyProvider<Counter, CounterRemain>(
                    create: (context) => CounterRemain(Provider.of<Counter>(context, listen: false)),
                    update: (context, counter, remainPre) {
                      return remainPre
                          ..updateCounter(counter);
                    },
                    child: Consumer<CounterRemain>(
                      builder: (context, remain, _){
                        return Text('剩余次数：${remain.countRemain}');
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
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

class CounterRemain with ChangeNotifier {

  int _countRemain = 60;

  Counter _counter;

  CounterRemain(this._counter);

  int get countRemain => _getCountRemain();

  int _getCountRemain(){
    var r = _countRemain - _counter.count;
    if (r > 0) {
      return r;
    }else {
      return 0;
    }
  }

  void updateCounter(Counter counter) {
    _counter = counter;
    notifyListeners();
  }
}
