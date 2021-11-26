import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:redux_sample/data/models/page.dart';
import 'package:redux_sample/data/models/user.dart';

class ReqresApiClient {
  final http.Client _httpClient = http.Client();

  Future<List<User>> fetchUsers() async {
    final url = Uri.parse('https://reqres.in/api/users');
    final response = await _httpClient.get(url);

    if (response.isSuccessful) {
      final json = jsonDecode(response.body);
      return Page.fromJson(json).data;
    } else {
      throw Exception();
    }
  }
}

extension _ResponseExtensions on http.Response {
  bool get isSuccessful =>
      statusCode >= HttpStatus.ok && statusCode < HttpStatus.multipleChoices;
}
