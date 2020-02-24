import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderPage extends StatefulWidget {
  @override
  _FutureProviderPageState createState() => _FutureProviderPageState();
}

class _FutureProviderPageState extends State<FutureProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureProvider'),
      ),
      body: FutureProvider<String>.value(
        value: fetchData(),
        child: Center(
          child: Consumer<String>(
            builder: (_, data, __) {
              return Text(data ?? "加载中...");
            },
          ),
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return "I'am the fetch data";
  }
}
