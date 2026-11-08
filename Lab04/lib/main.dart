import 'package:flutter/material.dart';

import 'vegetable_screen.dart';
import 'cheese_screen.dart';
import 'fries_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Store',
      initialRoute: 'menu',
      routes: {
        'menu': (context) => const MenuScreen(),
        'vegetable': (context) => const VegetableScreen(),
        'cheese': (context) => const CheeseScreen(),
        'fries': (context) => const FriesScreen(),
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Store Menu'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            menuCard(
              context,
              'Vegetable Pizza',
              'assets/images/Vegetable Pizza.jpg',
              'vegetable',
            ),
            menuCard(
              context,
              'Cheese Pizza',
              'assets/images/Cheese Pizza.jpg',
              'cheese',
            ),
            menuCard(context, 'Fries', 'assets/images/Fries.jpg', 'fries'),
          ],
        ),
      ),
    );
  }

  Widget menuCard(
    BuildContext context,
    String name,
    String imagePath,
    String route,
  ) {
    return Card(
      color: Colors.orange,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        leading: Image.asset(
          imagePath,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
