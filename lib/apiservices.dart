import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uas_ambw/dataclass.dart';

class Service {
  Future<List<DataAPI>> getAllData() async {
    final response = await http.get(
      Uri.parse('https://api-berita-indonesia.vercel.app/cnbc/terbaru/'),
    );
    if (response.statusCode == 200) {
      List jsonResp = json.decode(response.body);
      return jsonResp.map((e) => DataAPI.fromJSON(e)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}
