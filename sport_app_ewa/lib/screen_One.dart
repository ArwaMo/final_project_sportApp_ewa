import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SportsScreen(),
    );
  }
}

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SportsScreen()),
                );
              },
              child: const Text('Football'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle other sports
              },
              child: const Text('Other Sports'),
            ),
          ],
        ),
      ),
    );
  }
}

class SportsApp {
  List<String> sports;

  SportsApp(this.sports);

  void printSportsList() {
    print('List of sports:');
    for (String sport in sports) {
      if (sport != 'Football') {
        print('Coming soon');
      } else {
        print(sport);
      }
    }
  }
}
