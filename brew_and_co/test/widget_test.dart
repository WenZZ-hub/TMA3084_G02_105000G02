import 'package:flutter_test/flutter_test.dart';
import 'package:brew_and_co/main.dart';

void main() {
  testWidgets('Coffee shop menu displays correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BrewAndCoApp());

    expect(find.text('BREW & CO.'), findsOneWidget);
    expect(find.text('Explore our menu'), findsOneWidget);
  });
}
