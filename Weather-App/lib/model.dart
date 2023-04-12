/*{"coord":{"lon":73.1338,"lat":33.7104},
"weather":[{"id":800,"main":"Clear","description":"clearsky","icon":"01d"}],
"base":"stations",
"main":{"temp":297.5,"feels_like":296.9,"temp_min":297.5,"temp_max":297.5,"pressure":1015,"humidity":35,"sea_level":1015,"grnd_level":956},
"visibility":10000,
"wind":{"speed":2.58,"deg":282,"gust":2.89},
"clouds":{"all":0},"dt":1636353151,
"sys":{"type":2,"id":2007435,"country":"PK","sunrise":1636335167,
"sunset":1636373381},
"timezone":18000,
"id":1162015,
"name":"Islamabad",
"cod":200}


//MVC concept is used View is in main.dart , Model is here and controller is data_service.dart
*/
class weatherResponse {
  final String cityname;
  final weatherInfo weatherinfo;
  final temperatureInfo temperatureinfo;
  String get iconURL {
    return "http://openweathermap.org/img/wn/${weatherinfo.icon}@2x.png";
  }

  weatherResponse(
      {required this.cityname,
      required this.weatherinfo,
      required this.temperatureinfo});

  //factory is a special function designed to get many values in return
  factory weatherResponse.fromJson(Map<String, dynamic> jsonData) {
  final id = jsonData["id"];
    final cityname = jsonData["name"];
    final weatherinfojs = jsonData['weather'][0];
    final weatherinfo = weatherInfo.fromJson(weatherinfojs);
    final temperatureinfojs = jsonData['main'];
    final temperatureinfo = temperatureInfo.fromJson(temperatureinfojs);
    return weatherResponse(
        cityname: cityname,
        weatherinfo: weatherinfo,
        temperatureinfo: temperatureinfo);
  }
}

class weatherInfo {
  final String description;
  final String icon;

  weatherInfo({required this.description, required this.icon});
  
  factory weatherInfo.fromJson(Map<String, dynamic> jsonData) {
    final description = jsonData["description"];
    final icon = jsonData["icon"];
    return weatherInfo(description: description, icon: icon);
  }
}

class temperatureInfo {
  final double temperature;

  temperatureInfo({required this.temperature});
  factory temperatureInfo.fromJson(Map<String, dynamic> jsonData) {
    final temperature = jsonData["temp"];
    return temperatureInfo(temperature: temperature);
  }
}
