import 'dart:convert';
import 'package:http/http.dart' as http;

class GetPostService {
  final String apiUrl = 'jsonplaceholder.typicode.com';
  final String apiPath = '/posts';

  Future<List> execute() async {
    final Uri uri = Uri.https(apiUrl, apiPath);
    http.Response request = await http.get(uri);
    return json.decode(request.body);
  }
}
