import 'myLib.dart';

void main() {
  Employee employee = Employee('Wandie', 5000.0, 2.0, 35.0);

  double overtimePay = employee.calculateOvertimePay();
  double totalSalary = employee.calculateTotalSalary();

  print('Employee Name: ${employee.name}');
  print('Basic Salary: \$${employee.basicSalary.toStringAsFixed(2)}');
  print('Overtime Pay: \$${overtimePay.toStringAsFixed(2)}');
  print('Total Salary = \$${totalSalary.toStringAsFixed(2)} USD');
}
