import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TestPage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Consumer<TestCounter>(
                builder: (context, counter, child) {
                  return Text("${counter.count}");
                },
              ),
              Consumer<TestCounter>(
                builder: (context, counter, child) {
                  return FlatButton(
                    onPressed: () => counter.increment(),
                    child: Text("add"),
                  );
                },
              ),
              Consumer<TestCounter>(
                builder: (context, counter, child) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestSecondPage(),
                          ));
                    },
                    child: Text("TestSecond"),
                  );
                },
              ),
            ],
          ),
        ),
      );
  }
}

class TestSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  	var testCounter = Provider.of<TestCounter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("TestSecondPage"),
      ),
      body: Center(
        child: Text("${testCounter.count}")
      ),
    );
  }
}

class TestCounter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
