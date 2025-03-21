import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/cat_image.dart';

class CatApi {
  final String apiKey =
      'live_yTPUbuFHkc342ZeZSJfkk1TdWqGwv09VuTURdPZn6GLUtOzA4kbfhS8kwHGpeFFL';

  Future<CatImage> fetchCatImage() async {
    final url = Uri.parse(
      'https://api.thecatapi.com/v1/images/search',
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
