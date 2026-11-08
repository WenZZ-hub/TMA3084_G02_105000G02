import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/main.dart';

void main() {
  testWidgets('Menu displays three items', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Fries'), findsOneWidget);
  });

  testWidgets('Tapping a card opens detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'A delicious pizza topped with fresh vegetables, cheese and tomato sauce.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('Back button returns to menu', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.text('Pizza Store Menu'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Fries'), findsOneWidget);
  });
}
