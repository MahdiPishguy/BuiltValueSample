import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'api_service.dart';

Future<void> main() async {
  _setUpLogging();
  runApp(
    MultiProvider(providers: [
      Provider(
        builder: (_) => ApiService.create(),
        dispose: (_, ApiService service) => service.client.dispose(),
      )
    ], child: MyApp()),
  );
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuiltValue Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuiltValue Sample'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final response = await Provider.of<ApiService>(context).getPosts();
          print(response);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
