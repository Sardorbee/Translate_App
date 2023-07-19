import 'dart:convert';


import 'package:translate_app/services/models/trans_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<TransModel> fetchTransData(
      String query, String lang1, String lang2) async {
    final response = await http.get(Uri.parse(
        'https://api.mymemory.translated.net/get?q=$query&langpair=$lang1|$lang2'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      return TransModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
