import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'Bangladesh';
      final openWeatherAPIKey = dotenv.env['OPEN_WEATHER_API_KEY'];
      final res = await http.get(
        // Construct the API URL with city name and your API key (from .env)
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
