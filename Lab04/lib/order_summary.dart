import 'package:flutter/material.dart';

import 'order.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    String itemName = 'Cheese Pizza';
    int quantity = 2;
    double unitPrice = 12.50;

    double total = orderTotal(quantity, unitPrice);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Item Name: $itemName', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Quantity: $quantity', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              'Total Price: RM ${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
