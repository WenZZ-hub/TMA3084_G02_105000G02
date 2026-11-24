import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 05 - DataTable',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DataTableScreen(),
    );
  }
}

class Car {
  final String carMake;
  final String model;
  final double price;

  const Car(this.carMake, this.model, this.price);
}

class DataTableScreen extends StatefulWidget {
  const DataTableScreen({super.key});

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  final List<Car> _cars = [
    const Car('Toyota', 'Vios', 85000),
    const Car('Honda', 'Civic', 130000),
    const Car('Perodua', 'Myvi', 55000),
    const Car('Proton', 'X50', 95000),
    const Car('Nissan', 'Almera', 83000),
  ];

  int? _sortColumnIndex;
  bool _sortAscending = true;

  void _sort(int columnIndex, bool ascending, int Function(Car, Car) compare) {
    _cars.sort((a, b) {
      return ascending ? compare(a, b) : compare(b, a);
    });

    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car DataTable'), centerTitle: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(
              label: const Text('Car Make'),
              onSort: (columnIndex, ascending) {
                _sort(
                  columnIndex,
                  ascending,
                  (a, b) => a.carMake.compareTo(b.carMake),
                );
              },
            ),
            DataColumn(
              label: const Text('Model'),
              onSort: (columnIndex, ascending) {
                _sort(
                  columnIndex,
                  ascending,
                  (a, b) => a.model.compareTo(b.model),
                );
              },
            ),
            DataColumn(
              label: const Text('Price (RM)'),
              numeric: true,
              onSort: (columnIndex, ascending) {
                _sort(
                  columnIndex,
                  ascending,
                  (a, b) => a.price.compareTo(b.price),
                );
              },
            ),
          ],
          rows: _cars.map((car) {
            return DataRow(
              cells: [
                DataCell(Text(car.carMake)),
                DataCell(Text(car.model)),
                DataCell(Text(car.price.toStringAsFixed(2))),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
