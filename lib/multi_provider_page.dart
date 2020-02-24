import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderPage extends StatefulWidget {
  @override
  _MultiProviderPageState createState() => _MultiProviderPageState();
}

class _MultiProviderPageState extends State<MultiProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiProvider'),
      ),
//      body: FutureProvider<String>(
//        create: (context) => fetchData(),
//        child: Center(
//          child: Consumer<String>(
//            builder: (_, data, __){
//              return Text(data ?? "加载中...");
//            },
//          ),
//        ),
//      ),
      body: MultiProvider(
        providers: [
          FutureProvider<User>(create: (context) => fetchData(),),
          ChangeNotifierProvider<Counter>(create: (context) => Counter(),)
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Consumer<User>(
                builder: (_, user, __){
                  return _getUserWidget(user);
                },
              ),
              Consumer<Counter>(
                builder: (_, counter, __){
                  return _getCounterWidget(counter);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<User> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return User("teaphy", 20);
  }

  Widget _getUserWidget(User user) {
    if (null == user) {
      return Text('加载中...');
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('name: ${user.name}'),
          Text('age: ${user.age}')
        ],
      );
    }
  }

  Widget _getCounterWidget(Counter counter) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('clicked: ${counter.count}'),
        FlatButton(
          onPressed: () => counter.increment(),
          child: Text('add'),
        )
      ],
    );
  }
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
