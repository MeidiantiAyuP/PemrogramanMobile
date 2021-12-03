import 'dart:convert';

  class Mahasiswa {
    String id;
    String nama;
    String nim;
    String alamat;
    String email;
    String foto;
    String nim_progmob;

    Mahasiswa({required this.id, required this.nama, required this.nim, required this.alamat, required this.email, required this.foto, required this.nim_progmob});

    factory Mahasiswa.fromJson(Map<String, dynamic>map) {
      return Mahasiswa(
          id: map["id"],
          nama: map["nama"],
          nim: map["nim"],
          alamat: map["alamat"],
          email: map["email"],
          foto: map["foto"],
          nim_progmob: map["nim_progmob"]);
    }

    Map<String, dynamic> toJson() {
      return {
        "id": id,
        "nama": nama,
        "nim": nim,
        "alamat": alamat,
        "email": email,
        "foto": foto,
        "nim_progmbob": nim_progmob
      };
    }

    @override
    String toString() {
      return 'Mahasiswa{id: $id, nama: $nama, nim: $nim, alamat:$alamat, email:$email, foto:$foto, nim_progmob:$nim_progmob}';
    }
  }
    List<Mahasiswa> mahasiswaFromJson(String jsonData) {
      final data = json.decode(jsonData);
      return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
    }

    String mahasiswaToJson(Mahasiswa data) {
      final jsonData = data.toJson();
      return json.encode(jsonData);
    }


class Dosen {
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Dosen({required this.id, required this.nama, required this.nidn, required this.alamat, required this.email, required this.foto, required this.nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic>map) {
    return Dosen(
        id: map["id"],
        nama: map["nama"],
        nidn: map["nidn"],
        alamat: map["alamat"],
        email: map["email"],
        foto: map["foto"],
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": nama,
      "nim": nidn,
      "alamat": alamat,
      "email": email,
      "foto": foto,
      "nim_progmbob": nim_progmob
    };
  }

  @override
  String toString() {
    return 'Dosen{id: $id, nama: $nama, nidn: $nidn, alamat:$alamat, email:$email, foto:$foto, nim_progmob:$nim_progmob}';
  }
}
List<Dosen> dosenFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String dosenToJson(Dosen data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

