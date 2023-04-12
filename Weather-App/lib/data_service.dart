import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model.dart';
//as alias is used because there may different classes and it may cause clash alias
//will help avoid that clash

class DataService {
  Future<weatherResponse> getWeather(String city) async {
    final queryParameter = {
      'q': city,
      'appid': "518fd45f91afdd478a93d7249ff5cd78",
      'units': "metric"
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameter);
    final response = await http.get(uri);

    //if we donot make function async and if we donot use await with http
    //it will not be able to access variable of Future type
    //json is deserialized it can be serialized by using jsonEncode

    final json = jsonDecode(response.body);
    return weatherResponse.fromJson(json);
  }
}
