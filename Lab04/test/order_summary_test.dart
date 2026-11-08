import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/order_summary.dart';

void main() {
  testWidgets('Order summary displays correct total', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: OrderSummary()));

    expect(find.text('Item Name: Cheese Pizza'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('Total Price: RM 25.00'), findsOneWidget);
  });
}
