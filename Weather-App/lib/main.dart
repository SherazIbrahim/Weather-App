import 'package:flutter/material.dart';
import 'package:weatherapp/model.dart';
import 'data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DataService ds =  DataService();

  final _cityTextController = TextEditingController();
  String _cityname = "Islamabad";

  weatherResponse? _response;
  void _getWeatherData() async {
    _cityname = _cityTextController.text;
    final response = await ds.getWeather(_cityname);
    setState(() => {_response = response});
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Weather App"),
      ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (_response != null)
              Column(children: [
                Image.network('${_response?.iconURL}'),
                Text(
                  '${_response?.temperatureinfo.temperature}',
                  style: const TextStyle(fontSize: 30),
                ),
                Text('${_response?.weatherinfo.description}'),
                Text("${_response?.cityname}"),
              ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityTextController,
                  decoration: const InputDecoration(labelText: "Enter City Name "),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _getWeatherData,
              child: const Text("Search"),
            ),

         
          ]),
        ),
      ),
    ));
  }
}
