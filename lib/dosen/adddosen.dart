import 'dart:io';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:progmobkotlin2021/model.dart';
import 'package:image_picker/image_picker.dart';
import '../apiservice.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddDsn extends StatefulWidget{
  final String title;

  AddDsn({ required this.title});

  @override
  _AddDsnState createState() => new _AddDsnState(title);
}

class _AddDsnState extends State<AddDsn>{
  final GlobalKey<FormState> _formState=GlobalKey<FormState>();
  final String title;
  _AddDsnState(this.title);
  bool _isLoading=false;
  Dosen dsn=new Dosen(id: 'id', nama: 'nama', nidn: 'nidn', alamat: 'alamat', email: 'email', nim_progmob: 'nim_progmob', foto: 'foto');
  File _imageFile=null!;

  Future<void> _pickImage(ImageSource source) async{
    File selected = (await ImagePicker.platform.pickImage(source: source) as File);

    setState(() {
      _imageFile=selected;
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Form(
                  key: _formState,
                  child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "NIDN",
                            hintText: "NIDN",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onSaved: (String? value){this.dsn.nidn=value!;},
                        ),
                        SizedBox(
                          height:15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nama",
                            hintText: "Nama Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onSaved: (String? value){this.dsn.nama=value!;},
                        ),
                        SizedBox(
                          height:15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Alamat",
                            hintText: "Alamat Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onSaved: (String? value){this.dsn.alamat = value!;},
                        ),
                        SizedBox(
                          height:15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Email Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? value){this.dsn.email=value!;},
                        ),
                        SizedBox(
                          height:15,
                        ),

                        _imageFile==null
                            ? Text('Silakan memilih gambar dahulu')
                            : Image.file(
                          _imageFile,
                          fit: BoxFit.cover,
                          height: 300.0,
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                        ),
                        MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            color: Colors.blue,
                            onPressed: (){
                              _pickImage(ImageSource.gallery);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.image,color: Colors.white,),
                                Text("Uploud Foto",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          color: Colors.blue,
                          onPressed: () async{
                            return showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("Simpan Data"),
                                content: Text("Apakah Anda Akan Menyimpan Data Ini"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () async{
                                      _formState.currentState?.save();
                                      setState(() => _isLoading=true);
                                      this.dsn.nim_progmob="72190361";
                                      ApiService().createDsnwithFoto(this.dsn, _imageFile, _imageFile.path).then((isSuccess) {
                                        setState(() => _isLoading = false);
                                        if (isSuccess) {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text('Ya'),
                                  ),

                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('Tidak'),
                                  )
                                ],
                              );
                            },
                            );
                          },
                          child: Text("Simpan",
                            textAlign: TextAlign.center,
                            style:TextStyle(
                                color:Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ]
                  ),
                ),

                _isLoading
                    ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),

                    Center(
                      child:CircularProgressIndicator(),
                    ),
                  ],
                )
                    : Container(),
              ],
            ),
          )
      ),
    );
  }
}