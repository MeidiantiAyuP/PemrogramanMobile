import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMahasiswa extends StatefulWidget {//kelas halaman
  const DashboardMahasiswa({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardMahasiswa> createState() => _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa> {
  //kelas stage
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),//gambar +
            onPressed:(){},
          ),
        ],
      ),
      body: Container(
        child: GestureDetector(
            child: Card(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(//isi klik icon user
                      title: Text("Meidianti Ayu Permatasari"),
                      leading: Icon(Icons.people),//taruh di depan
                      subtitle: Text("72190361 - meidianti.ayu@si.ukdw.ac.id"),
                      trailing: PopupMenuButton(//taruh di belakang
                          itemBuilder: (_) => <PopupMenuItem<String>>[//titik tiga
                            new PopupMenuItem<String>(//muncul pilihan
                                child: const Text('Update'), value: 'Update'),
                            new PopupMenuItem<String>(
                                child: const Text('Delete'), value: 'Delete'),
                          ]
                      ),
                    )
                  ]
              ),
            )
        ),
      ),
    );
  }
}