import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMatakuliah extends StatefulWidget {//kelas halaman
  const DashboardMatakuliah({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardMatakuliah> createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
  //kelas stage
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),//tanda plus
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
                    ListTile(
                      title: Text("Pemrograman Mobile"),
                      leading: Icon(Icons.people),
                      subtitle: Text("SL3313 - 3 SKS"),
                      trailing: PopupMenuButton(
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                                child: const Text('Update'), value: 'Update'),
                            new PopupMenuItem<String>(//pilihan
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