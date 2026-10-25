import 'package:flutter/material.dart';

void main() {
  runApp(const BrewAndCoApp());
}

const Color coffeeBrown = Color(0xFF593D2B);
const Color cream = Color(0xFFF8F3EA);
const Color caramel = Color(0xFFC68B59);

class BrewAndCoApp extends StatelessWidget {
  const BrewAndCoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BREW & CO.',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: coffeeBrown),
        fontFamily: 'Arial',
      ),
      home: const CoffeeMenuPage(),
    );
  }
}

class CoffeeMenuPage extends StatelessWidget {
  const CoffeeMenuPage({super.key});

  static const List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Iced Latte',
      'description': 'Espresso, fresh milk & ice',
      'price': 9.90,
      'icon': Icons.local_cafe,
      'category': 'BEST SELLER',
    },
    {
      'name': 'Caramel Macchiato',
      'description': 'Espresso with caramel drizzle',
      'price': 12.90,
      'icon': Icons.coffee,
      'category': 'SIGNATURE',
    },
    {
      'name': 'Cappuccino',
      'description': 'Rich espresso with milk foam',
      'price': 10.50,
      'icon': Icons.local_cafe,
      'category': 'CLASSIC',
    },
    {
      'name': 'Chocolate Croissant',
      'description': 'Flaky pastry with chocolate',
      'price': 7.50,
      'icon': Icons.bakery_dining,
      'category': 'PASTRY',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cream,
        title: const Text(
          'BREW & CO.',
          style: TextStyle(
            color: coffeeBrown,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Shopping bag',
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, color: coffeeBrown),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: coffeeBrown,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YOUR DAILY',
                    style: TextStyle(
                      color: caramel,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'coffee ritual.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Good coffee. Good mood. Good day.',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Explore our menu',
              style: TextStyle(
                color: coffeeBrown,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Freshly brewed, made for you.',
              style: TextStyle(color: Colors.brown),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                _categoryChip(Icons.coffee, 'Coffee'),
                const SizedBox(width: 8),
                _categoryChip(Icons.icecream, 'Cold drinks'),
                const SizedBox(width: 8),
                _categoryChip(Icons.bakery_dining, 'Bakery'),
              ],
            ),
            const SizedBox(height: 18),
            for (final item in menuItems) _menuCard(item),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFEADCCB),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(Icons.favorite, color: coffeeBrown, size: 30),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Made with love',
                          style: TextStyle(
                            color: coffeeBrown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Every cup tells a story.',
                          style: TextStyle(color: coffeeBrown),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: coffeeBrown,
        unselectedItemColor: Colors.brown.shade300,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  static Widget _categoryChip(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE5D7C6)),
        ),
        child: Column(
          children: [
            Icon(icon, color: coffeeBrown),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: coffeeBrown,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _menuCard(Map<String, dynamic> item) {
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 76,
              height: 82,
              decoration: BoxDecoration(
                color: const Color(0xFFF0E4D5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                item['icon'] as IconData,
                color: coffeeBrown,
                size: 38,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['category'] as String,
                    style: const TextStyle(
                      color: caramel,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['name'] as String,
                    style: const TextStyle(
                      color: coffeeBrown,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['description'] as String,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'RM ${(item['price'] as double).toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: coffeeBrown,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Add to bag',
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
              color: coffeeBrown,
            ),
          ],
        ),
      ),
    );
  }
}
