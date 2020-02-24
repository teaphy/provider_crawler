import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListenableProviderPage extends StatefulWidget {
  @override
  _ListenableProviderPageState createState() => _ListenableProviderPageState();
}

class _ListenableProviderPageState extends State<ListenableProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListenableProvider'),
      ),
//      body: ListenableProvider<Counter>(
//        create: (context) => Counter(),
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Consumer<Counter>(
//                builder: (context, counter, child){
//                  return Text("${counter.count}");
//                },
//              ),
//              Consumer<Counter>(
//                builder: (context, counter, child){
//                  return  FlatButton(
//                    onPressed: () => counter.increment(),
//                    child: Text("add"),
//                  );
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
      body: ListenableProvider<Counter>.value(
        value: Counter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Consumer<Counter>(
                builder: (context, counter, child) {
                  return Text("${counter.count}");
                },
              ),
              Consumer<Counter>(
                builder: (context, counter, child) {
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
    );
  }
}

class Counter extends Listenable {
  ObserverList<VoidCallback> _listeners = ObserverList<VoidCallback>();

  int _count = 0;

  int get count => _count;

  // 注册监听时调用
  // 注册当对象通知其侦听器时, 要调用的闭包
  @override
  void addListener(listener) {
    print("Counter addListener");

    if (!_listeners.contains(listener)) {
      _listeners.add(listener);
    }
  }

  // 从对象通知的闭包列表中删除先前注册的闭包。
  @override
  void removeListener(listener) {
    print("Counter removeListener");

    if (_listeners.contains(listener)) {
      _listeners.remove(listener);
    }
  }

  void increment() {
    _count++;
    _listeners.forEach((ele) => ele());
  }
}
