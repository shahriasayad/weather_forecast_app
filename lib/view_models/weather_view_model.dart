import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  Map<String, dynamic>? weatherData;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchWeather() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      final data = await _weatherService.getCurrentWeather();
      weatherData = data;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
