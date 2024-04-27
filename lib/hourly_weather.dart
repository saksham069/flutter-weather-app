import 'package:flutter/material.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key, required this.time, required this.tempC});

  final String? time;
  final String? tempC;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [
              Text(
                time ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 80,
                child: Divider(),
              ),
            ]),
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
