// mahasiswa_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:praktikumpabflutter/model/mahasiswa.dart';

class MahasiswaService {
  static final String _baseUrl =
      'http://1.1.1.1/my_mahasiswa/read_mahsiswa.php'; //ganti ip addres dengan ip addres kalian

  Future getData() async {
    Uri urlApi = Uri.parse(_baseUrl);
    final response = await http.get(urlApi);

    if (response.statusCode == 200) {
      return mahasiswaListFromJson(response.body.toString());
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  static final String _url =
      'http://1.1.1.1/my_mahasiswa/create_dosen.php'; //ganti ip addres dengan ip addres kalian

  Future insertData(Map<String, dynamic> data) async {
    Uri urlApi = Uri.parse(_url);

    final response = await http.post(
      urlApi,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result['status']) {
        // Data successfully inserted
        print('Data inserted successfully');
      } else {
        throw Exception('Failed to insert data. Message: ${result['message']}');
      }
    } else {
      throw Exception(
          'Failed to insert data. Status code: ${response.statusCode}');
    }
  }
}
