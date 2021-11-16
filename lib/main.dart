import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page 72190361'),
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
  void navigateLogin() async{//fungsi baru login logout
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? isLogin = prefs.getInt("is_Login");
    if(isLogin == 1){
      Navigator.pushReplacement(//hapus form
        context,//masuk ke kelas dart?
        MaterialPageRoute(builder: (context) => Dashboard(title: 'Dashboard 72190361 Tampil!',)),//masuk halaman lanjut pada kelas dashboard
      );
    }
  }

  @override
  void initState() {//generate=>overate
    navigateLogin();//panggil fungsi
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
            Text(
              'You have pushed the button this many times:',//Hal Utama
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Text(
                "Login",
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt("is_login",1);
                Navigator.pushReplacement(//tombol back hilang di halaman masuk
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard(title: 'Hai 72190361! Push Berjalan',)),//Hal awal masuk adalah button Login
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
      //),  This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
