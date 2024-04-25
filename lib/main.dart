import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => debugPrint("refresh"),
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(size: 30, Icons.refresh_rounded),
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Placeholder(
              fallbackHeight: 300,
              fallbackWidth: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Weather Forecast",
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Placeholder(
                    fallbackHeight: 150,
                    fallbackWidth: 110,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Placeholder(
                    fallbackHeight: 150,
                    fallbackWidth: 110,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Placeholder(
                    fallbackHeight: 150,
                    fallbackWidth: 110,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Placeholder(
                    fallbackHeight: 150,
                    fallbackWidth: 110,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Additional Information",
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //set min-height
                  Placeholder(
                    fallbackWidth: 100,
                  ),
                  Placeholder(
                    fallbackWidth: 100,
                  ),
                  Placeholder(
                    fallbackWidth: 100,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
