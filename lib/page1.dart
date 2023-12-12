import 'package:flutter/material.dart';
import 'package:praktikumpabflutter/service/mahasiswa_service..dart';

class InsertDataPage extends StatefulWidget {
  @override
  _InsertDataPageState createState() => _InsertDataPageState();
}

class _InsertDataPageState extends State<InsertDataPage> {
  final MahasiswaService apiService = MahasiswaService();
  final TextEditingController nbiController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Data Mahasiswa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nbiController,
                decoration: InputDecoration(labelText: 'NBI'),
              ),
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              TextField(
                controller: tanggalLahirController,
                decoration: InputDecoration(labelText: 'Tanggal Lahir'),
              ),
              TextField(
                controller: kelasController,
                decoration: InputDecoration(labelText: 'Kelas'),
              ),
              TextField(
                controller: jurusanController,
                decoration: InputDecoration(labelText: 'Jurusan'),
              ),
              TextField(
                controller: semesterController,
                decoration: InputDecoration(labelText: 'Semester'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Memanggil fungsi untuk memasukkan data ke server
                  _insertData();
                },
                child: Text('Insert Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk memasukkan data ke server
  void _insertData() async {
    try {
      Map<String, dynamic> data = {
        'nbi': nbiController.text,
        'nama': namaController.text,
        'alamat': alamatController.text,
        'tanggal_lahir': tanggalLahirController.text,
        'kelas': kelasController.text,
        'jurusan': jurusanController.text,
        'semester': semesterController.text,
      };

      await apiService.insertData(data);

      // Menampilkan pesan sukses atau keterangan lainnya
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data inserted successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      // Clear input fields setelah data berhasil dimasukkan
      nbiController.clear();
      namaController.clear();
      alamatController.clear();
      tanggalLahirController.clear();
      kelasController.clear();
      jurusanController.clear();
      semesterController.clear();
    } catch (e) {
      // Menampilkan pesan kesalahan jika terjadi error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
