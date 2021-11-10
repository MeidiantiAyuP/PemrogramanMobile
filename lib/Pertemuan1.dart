import 'package:flutter/material.dart';
import 'package:progmobkotlin2021/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan1 extends StatefulWidget {//kelas halaman
  const Pertemuan1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  //kelas stage
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [

              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Nama Lengkap",
                  hintText: "Missal: Meidianti Ayu P ",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama Wajib Diisi';
                  }
                  return null;
                },
              ),

              ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                  onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              ElevatedButton(
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.amberAccent),
                ),
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setInt("is_login",0);
                  Navigator.pushReplacement(//tombol back hilang di halaman masuk
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Demo Home Page 72190361',)), //tampilan ke Hal utama
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
