import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'weather_service.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _service = WeatherService();
  late Future<Weather> _weatherFuture;

  // Challenge 1 & 2 Controllers
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _weatherFuture = _service.fetchWeather(51.5074, -0.1278);
  }

  //Challenge 1
  void _getWeatherByCoords() {
    final lat = double.tryParse(latController.text) ?? 0;
    final lon = double.tryParse(lonController.text) ?? 0;

    setState(() {
      _weatherFuture = _service.fetchWeather(lat, lon);
    });
  }

  // Challenge 2
  void _getWeatherByCity() {
    setState(() {
      _weatherFuture =
          _service.fetchWeatherByCity(cityController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 🌈 Gradient Background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [

                // 🏷 Title
                const Text(
                  "Weather App",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // =========================
                //  CHALLENGE 1 UI
                // =========================
                _buildTextField(latController, "Enter Latitude"),
                _buildTextField(lonController, "Enter Longitude"),

                ElevatedButton(
                  onPressed: _getWeatherByCoords,
                  style: _buttonStyle(),
                  child: const Text("Get by Coordinates"),
                ),

                const SizedBox(height: 20),

                // =========================
                //CHALLENGE 2 UI
                // =========================
                _buildTextField(cityController, "Enter City Name"),

                ElevatedButton(
                  onPressed: _getWeatherByCity,
                  style: _buttonStyle(),
                  child: const Text("Search by City"),
                ),

                const SizedBox(height: 30),

                // =========================
                // WEATHER DISPLAY CARD
                // =========================
                FutureBuilder<Weather>(
                  future: _weatherFuture,
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(color: Colors.white);
                    }

                    if (snapshot.hasError) {
                      return Text(
                        "Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.white),
                      );
                    }

                    if (snapshot.hasData) {
                      final weather = snapshot.data!;

                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          children: [
                            Text(
                              weather.cityName,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // =========================
                            //CHALLENGE 3 (ICON)
                            // =========================
                            Image.network(
                              'https://openweathermap.org/img/wn/${weather.icon}@2x.png'
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "${weather.temperature.toStringAsFixed(1)}°C",
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              weather.description.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const Text("No data");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✨ Reusable TextField Design
  Widget _buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ✨ Button Style
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    );
  }
}