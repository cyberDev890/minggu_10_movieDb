import 'dart:convert';

import 'package:http/http.dart' show Client, Response;

import '../model/popular_movies.dart';
class ApiProvider {
  String apiKey = 'YOUR_API';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return PopularMovies.formJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }
}
