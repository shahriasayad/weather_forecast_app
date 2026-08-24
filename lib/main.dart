import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/weather/screen/weather_screen.dart';
import 'package:weather_app/features/weather/controller/weather_controller.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      initialBinding: BindingsBuilder(() {
        Get.put(WeatherController());
      }),
      home: const WeatherScreen(),
    );
  }
}
