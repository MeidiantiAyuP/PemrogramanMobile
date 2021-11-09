import 'package:flutter/material.dart';

class Pertemuan1 extends StatefulWidget {//kelas halaman
  const Pertemuan1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {//kelas stage
  int _counter = 2;

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
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Test Input",
                hintText: "Format Text yaitu: ",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(3),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.5),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Test Input 2",
                hintText: "Format Text yaitu: ",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(6),
                ),
              ),
            ),
            ElevatedButton(
               style: ElevatedButton.styleFrom(
                primary: Colors.blue,
               ),
                  onPressed: () {  },
                  child: Text(
                    "Simpan",
                  style: TextStyle(
                  color: Colors.red
          ),
          ),
        ),
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
