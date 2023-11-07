import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedLanguage = 'English'; // Default language

  void _changeLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Selection Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Language: $selectedLanguage',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newLanguage) {
                if (newLanguage != null) {
                  _changeLanguage(newLanguage);
                }
              },
              items:
                  <String>['English', 'Hindi', 'Arabic'].map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
