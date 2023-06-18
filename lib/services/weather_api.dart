import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  Future<dynamic> fetchWeatherData(String cityName) async {
    final apiKey = 'ee5eae13fae4b6eaceffb86a7257321b';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData;
      } else {
        print('Erro ao carregar os dados do clima.');
        return null;
      }
    } catch (error) {
      print('Erro ao se conectar ao servidor de clima: $error');
      return null;
    }
  }
}
