import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:progmobkotlin2021/dosen/dashboarddosen.dart';//lakukan import setiap direktori 4
import 'package:progmobkotlin2021/mahasiswa/dashboardmahasiswa.dart';
import 'package:progmobkotlin2021/matakuliah/dashboardmatakuliah.dart';
import 'package:progmobkotlin2021/jadwal/dashboardjadwal.dart';

class Dashboard extends StatefulWidget {//kelas halaman
  const Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //kelas stage
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        drawer: Drawer(//hamburger menu hub CRUD garis tiga
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(//TAMPILAN AKUN NAMA/EMAIL/LOGO
                accountName: Text("Meidianti Ayu Permatasari"),
                accountEmail: Text("meidianti.ayu@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "AU",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Data Dosen"),//h1
                trailing: Icon(Icons.people),//gambar user
                subtitle: Text("Menu CRUD Data Dosen"),//h2
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Mhasiswa"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Data Mahasiswa"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Dashboard Mahasiswa")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Data Matakuliah"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Dashboard Matakuliah")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Data Jadwal"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal")),
                  );
                },
              ),

              Divider(
                color: Colors.black,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text("Logout"),//ikon keluar
                trailing: Icon(Icons.exit_to_app),
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences
                      .getInstance();
                  await prefs.setInt("is_login", 0);
                  Navigator
                      .pushReplacement( //tombol back hilang di halaman masuk
                    context,
                    MaterialPageRoute(builder: (context) =>
                        MyHomePage(
                          title: 'Flutter Demo Home Page 72190361',)), //tampilan ke Hal utama
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
            child: Center(
                child: Text("Dashboard",
                    style: TextStyle(
                        fontSize: 20
                    ))
            )
        )
    );
  }

}


