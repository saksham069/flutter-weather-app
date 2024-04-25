import 'package:flutter/material.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key, required this.time, required this.tempC});

  final String? time;
  final String? tempC;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 110,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              time ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              size: 30,
              Icons.cloud,
            ),
            Text("${tempC ?? ""}°C"),
          ],
        ),
      ),
    );
  }
}
