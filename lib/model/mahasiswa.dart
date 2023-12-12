import 'dart:convert';

List<Mahasiswa> mahasiswaListFromJson(String str) {
  final startIndex = str.indexOf('['); // Find the start of the JSON array
  if (startIndex != -1) {
    final jsonString = str.substring(startIndex);
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((data) => Mahasiswa.fromJson(data)).toList();
  } else {
    throw FormatException('Invalid JSON format');
  }
}

String mahasiswaToJson(Mahasiswa data) => json.encode(data.toJson());

class Mahasiswa {
  String nbi;
  String nama;
  String kelas;
  String semester;
  String jurusan;
  DateTime tanggalLahir;
  String alamat;

  Mahasiswa({
    required this.nbi,
    required this.nama,
    required this.kelas,
    required this.semester,
    required this.jurusan,
    required this.tanggalLahir,
    required this.alamat,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        nbi: json["nbi"],
        nama: json["nama"],
        kelas: json["kelas"],
        semester: json["semester"],
        jurusan: json["jurusan"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "nbi": nbi,
        "nama": nama,
        "kelas": kelas,
        "semester": semester,
        "jurusan": jurusan,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "alamat": alamat,
      };
}
