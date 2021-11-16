import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardDosen extends StatefulWidget {//kelas halaman
  const DashboardDosen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardDosen> createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
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
                  title: Text("Argo Wibowo"),
                  leading: Icon(Icons.people),
                  subtitle: Text("11100908 - argo@staff.ukdw.ac.id"),
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