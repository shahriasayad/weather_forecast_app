import 'package:get/get.dart';
import 'package:weather_app/features/weather/service/weather_service.dart';

class WeatherController extends GetxController {
  final WeatherService _weatherService = WeatherService();

  var weatherData = Rx<Map<String, dynamic>?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final data = await _weatherService.getCurrentWeather();
      weatherData.value = data;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
