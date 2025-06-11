import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/cat_image.dart';

class CatApi {
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String uri = 'https://api.thecatapi.com/v1/images/search';
  Future<CatImage> fetchCatImage() async {
    final url = Uri.parse(
      uri,
    ).replace(queryParameters: {'has_breeds': '1', 'api_key': apiKey});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return CatImage.fromJson(data[0]);
    } else {
      throw Exception('Failed to load cat image');
    }
  }
}
