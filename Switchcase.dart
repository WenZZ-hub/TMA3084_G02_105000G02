import 'dart:io';

void main() {
  print('===== PIZZA ORDER CALCULATOR =====');
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
      print('Invalid pizza size!');
      return;
  }

  stdout.write('Enter quantity: ');
  int? quantity = int.tryParse(stdin.readLineSync() ?? '');

  if (quantity == null || quantity <= 0) {
    print('Invalid quantity!');
    return;
  }

  double total = price * quantity;

  print('\n===== ORDER SUMMARY =====');
  print('Pizza size: ${size.toUpperCase()}');
  print('Price per pizza: RM${price.toStringAsFixed(2)}');
  print('Quantity: $quantity');
  print('Total payment: RM${total.toStringAsFixed(2)}');
}
