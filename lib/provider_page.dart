import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  final User user;

  ProviderPage() : user = User("teaphy", 20);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
//      body: Provider<User>(
//        create: (context) => User("teaphy", 20),
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Text('name: ${Provider.of<User>(context).name}'),
//              Text('age: ${Provider.of<User>(context).age}')
//            ],
//          ),
//        ),
//      ),
      body: Provider<User>.value(
        value: widget.user,
        child: Consumer(
          builder: (_, user, __) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('name: ${Provider.of<User>(context).name}'),
                  Text('age: ${Provider.of<User>(context).age}')
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);
}
