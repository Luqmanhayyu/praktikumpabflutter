import 'package:flutter/material.dart';
import 'package:praktikumpabflutter/model/mahasiswa.dart';
import 'package:praktikumpabflutter/page2.dart';
import 'package:praktikumpabflutter/service/mahasiswa_service..dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  late Future data;
  List<Mahasiswa> data2 = [];

  @override
  void initState() {
    data = MahasiswaService().getData();
    data.then((value) {
      setState(() {
        data2 = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List data',
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsertDataPage2()),
              );
            },
            child: Text(
              'Tambah Data Dosen',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ],
      ),
      body: data2.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: data2.length,
              itemBuilder: (context, index) {
                return ListTile(
                  subtitle: Column(
                    children: [
                      Text('Nbi: ${data2[index].nbi}'),
                      Text('Nama: ${data2[index].nama}'),
                      Text('Kelas: ${data2[index].kelas}'),
                      Text('Alamat: ${data2[index].alamat}'),
                      Text('Jurusan: ${data2[index].jurusan}'),
                      Text(
                          'Tanggal Lahir: ${data2[index].tanggalLahir.day}-${data2[index].tanggalLahir.month}-${data2[index].tanggalLahir.year}'),
                      Text('Semester: ${data2[index].semester}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
