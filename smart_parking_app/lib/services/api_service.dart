import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://10.16.156.149:3000/api/parking";

  static Future<Map<String, dynamic>> getData() async {
    final res = await http.get(Uri.parse("$baseUrl/status"));
    return json.decode(res.body);
  }
}