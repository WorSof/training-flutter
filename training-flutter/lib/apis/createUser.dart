import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateUserService {
  final String apiUrl =
      'us-central1-training-flutter-personalsoft.cloudfunctions.net';
  final String apiPath = '/server/save';

  final Map<String, dynamic> _bodyRequest = {
    'firstName': 'JUAN',
    'lastName': 'MARIN',
    'age': 22
  };

  final Map<String, String> _headerRequest = {
    'Content-Type': 'application/json'
  };

  Future<Map> execute() async {
    final Uri uri = Uri.https(apiUrl, apiPath);

    dynamic request = await http.post(
      uri,
      headers: _headerRequest,
      body: jsonEncode(_bodyRequest),
    );

    return json.decode(request.body);
  }
}
