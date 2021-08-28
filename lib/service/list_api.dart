import 'dart:convert';
import 'package:book_app/model/clients_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Client>> loadData() async {
    try {
      final String url =
          'https://run.mocky.io/v3/d53400a3-6126-495e-9d16-0b4414b537b3';
      final http.Response response = await http.get(Uri.parse(url));
      print(response.statusCode.toString()); //? API call successful
      print(response.body);
      final String correctBody = response.body + '}'; //Correct response
      final resp = json.decode(correctBody);
      final clientsData = resp["clients"];
      return List.from(clientsData)
          .map<Client>((item) => Client.fromMap(item))
          .toList();
    } catch (e) {
      print('@@@@in exception: $e');
      return [];
    }
  }
}
