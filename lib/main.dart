import 'package:flutter/material.dart';
import 'package:provider_crawler/listenable_provider_page.dart';
import 'package:provider_crawler/provider_page.dart';
import 'package:provider_crawler/proxy_provider_page.dart';
import 'package:provider_crawler/selector.dart';
import 'package:provider_crawler/stream_provider_.page.dart';
import 'package:provider_crawler/value_listenable_provider_page.dart';

import 'change_notifier_provider_page.dart';
import 'change_notifier_proxy_provider_page.dart';
import 'future_provider_page.dart';
import 'multi_provider_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage('ProviderCrawler'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String _title;

  HomePage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListenableProviderPage(),
                  )),
              child: Text('ListenableProvider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ValueListenableProviderPage(),
                  )),
              child: Text('ValueListenableProvider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProviderPage(),
                  )),
              child: Text('ChangeNotifierProvider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamProviderPage(),
                  )),
              child: Text('StreamProvider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProxyProviderPage(),
                  )),
              child: Text('ChangeNotifierProxyProvider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FutureProviderPage(),
                  )),
              child: Text('FutureProvider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiProviderPage(),
                  )),
              child: Text('MultiProvider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderPage(),
                  )),
              child: Text('Provider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProxyProviderPage(),
                  )),
              child: Text('ProxyProvider'),
            ),
            FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectorPage(),
                  )),
              child: Text('Selector'),
            ),
          ],
        ),
      ),
    );
  }
}
