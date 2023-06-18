import 'package:flutter/material.dart';
import 'package:oat/screens/detalhes_screen.dart';
import 'package:oat/services/weather_api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = '';

  void fetchWeatherData() async {
    WeatherService weatherService = WeatherService();
    var weatherData = await weatherService.fetchWeatherData(cityName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(weatherData: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OAT - Tela Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Digite o nome da cidade:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    cityName = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                fetchWeatherData();
              },
              child: Text('Mostrar Detalhes'),
            ),
          ],
        ),
      ),
    );
  }
}
