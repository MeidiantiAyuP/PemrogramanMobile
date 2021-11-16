import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardJadwal extends StatefulWidget {//kelas halaman
  const DashboardJadwal({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardJadwal> createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
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
            child: Card(//CARDVIEW TEMPLATE
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(//isi
                      title: Text("SELASA"),//bagian atas
                      leading: Icon(Icons.book),//taruh di depan
                      subtitle: Text("sesi 3 - 13:30 - 15:30"),//tengah bawah
                      trailing: PopupMenuButton(//taruh di belakang
                          itemBuilder: (_) => <PopupMenuItem<String>>[
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