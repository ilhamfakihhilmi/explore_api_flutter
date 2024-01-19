import 'dart:convert';

import 'package:apps_api/model/sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Sample? result;
  // fake method for simulation
  Future _loadJsonSample() async {
    String jsonString = await rootBundle.loadString('assets/sample.json');
    //proses mapping data
    final jsonData = jsonDecode(jsonString); // agar data menjadi object json
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      result = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Foundamental Parsing Json')),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                _loadJsonSample();
              },
              child: const Text('Panggil data Json'),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '$result',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
