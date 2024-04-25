import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key, required this.tempC});

  final String? tempC;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${tempC ?? ""}°C",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Icon(size: 70, Icons.cloud),
          ],
        ),
      ),
    );
  }
}
