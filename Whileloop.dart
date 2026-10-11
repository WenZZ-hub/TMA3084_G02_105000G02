import 'dart:io';

void main() {
  bool ordering = true;

  while (ordering) {
    print('\n===== PIZZA ORDER CALCULATOR =====');
    print('Small  : RM5.00');
    print('Medium : RM7.00');
    print('Large  : RM10.00');

    stdout.write('\nEnter pizza size (small, medium, large): ');
    String size = (stdin.readLineSync() ?? '').toLowerCase().trim();

    double price;

    switch (size) {
      case 'small':
        price = 5.0;
        break;
      case 'medium':
        price = 7.0;
        break;
      case 'large':
        price = 10.0;
        break;
      default:
        print('Invalid pizza size! Please try again.');
        continue;
    }

    stdout.write('Enter quantity: ');
    int? quantity = int.tryParse(stdin.readLineSync() ?? '');

    if (quantity == null || quantity <= 0) {
      print('Invalid quantity! Please try again.');
      continue;
    }

    double total = price * quantity;

    print('\n===== ORDER SUMMARY =====');
    print('Pizza size: ${size.toUpperCase()}');
    print('Quantity: $quantity');
    print('Total payment: RM${total.toStringAsFixed(2)}');

    stdout.write('\nOrder again? (yes/no): ');
    String answer = (stdin.readLineSync() ?? '').toLowerCase().trim();

    if (answer != 'yes') {
      ordering = false;
      print('Thank you for your order!');
    }
  }
}
