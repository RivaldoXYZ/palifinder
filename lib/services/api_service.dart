import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = "https://reqres.in/api/users";

  static Future<List<User>> getUsers({int page = 1, int perPage = 10}) async {
    final response = await http.get(
      Uri.parse("$baseUrl?page=$page&per_page=$perPage"),
      headers: {
        "x-api-key": "reqres_700c26a90b0d4c4e913119b35e6d8c6c",
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List data = jsonData["data"];

      return data.map((e) => User.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
