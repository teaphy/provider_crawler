import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProxyProviderPage extends StatefulWidget {

  @override
  _ProxyProviderPageState createState() => _ProxyProviderPageState();
}

class _ProxyProviderPageState extends State<ProxyProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProxyProvider'),
      ),
      body: Provider<User>(
        create: (context) => User("teaphy", 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Consumer<User>(
                builder: (_, user, __){
                  return ProxyProvider<User, Service>(
                    create: (context) => Service(user),
                    update: (context, user, previous) {
                      return previous..user = user;
                    },
                    child: Consumer<Service>(
                      builder: (_, service, __){
                        return Text('serviceFor: ${service.serviceFor}');
                      },
                    ),
                  );
                },
              )
            ],
          ),
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

class Service {
  User _user;

  Service(this._user);

  String get serviceFor => _user.name;

  set user(User user) => _user = user;
}
