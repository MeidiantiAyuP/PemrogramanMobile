import 'package:flutter/material.dart';
import 'package:progmobkotlin2021/Pertemuan1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Pertemuan1(title: 'Flutter Demo Home Page ini dibuat oleh 72190361'),
    );
  }
}

class MyHomePage extends StatefulWidget {//kelas halaman
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {//kelas stage
  int _counter = 0;

  void _incrementCounter() {
    setState(() {//update data

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
       // onPressed: _incrementCounter,
       // tooltip: 'Increment',
       // child: const Icon(Icons.add),
      //),  This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
