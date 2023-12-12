import 'package:flutter/material.dart';
import 'package:praktikumpabflutter/model/mahasiswa.dart';
import 'package:praktikumpabflutter/page1.dart';
import 'package:praktikumpabflutter/service/mahasiswa_service..dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  late Future data;
  List<Mahasiswa> data2 = [];
  int _currentIndex = 0;

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
                MaterialPageRoute(builder: (context) => InsertDataPage()),
              );
            },
            child: Text(
              'Tambah Data Mahasiswa',
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Insert Mahasiswa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3),
            label: 'Insert Dosen',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle navigation based on index
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
