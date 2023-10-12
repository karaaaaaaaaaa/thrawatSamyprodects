import 'dart:convert';

import 'package:http/http.dart' as http;

class api {
  Future<dynamic> get({required String url, String ?token}) async {
   Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
      // return response;
    } else {
      throw Exception("there are an problems${response.statusCode}");
    }
  }

  Future<dynamic> post({
    required String url,
    String? token,
    required Map<String, String> body,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("${response.statusCode} with  ${response.body}");
    }
  }

  Future<dynamic> put({
    required String url,
    String? token,
    required Map<String, String> body,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("${response.statusCode} with  ${response.body}");
    }
  }
}
