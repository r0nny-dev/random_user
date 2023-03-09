import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_random/models/random_user_model.dart';

Future<RandomUser> getRandomUser() async {
  const String url = "https://randomuser.me/api/";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return RandomUser.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Falha na Comunição entre a aplicação e a API");
  }
}
