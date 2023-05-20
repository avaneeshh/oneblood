import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  Map<String, int> _inventory = {};

  @override
  void initState() {
    super.initState();
    _fetchInventory();
  }

  void _fetchInventory() {
    _database
        .child('patients')
        .onValue
        .listen((event) {
      Map<String, int> inventory = {
        'A+ve': 0,
        'A-ve': 0,
        'B+ve': 0,
        'B-ve': 0,
        'AB+ve': 0,
        'AB-ve': 0,
        'O+ve': 0,
        'other': 0,
      };
      final DataSnapshot snapshot = event.snapshot;
      (snapshot.value as Map<dynamic, dynamic>?)?.forEach((key, value) {
        final bloodType = value['bloodType'];
        inventory.update(bloodType, (count) => count + 1);
      });

      setState(() {
        _inventory = inventory;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Inventory'),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount: _inventory.length,
        itemBuilder: (BuildContext context, int index) {
          final bloodType = _inventory.keys.elementAt(index);
          final count = _inventory[bloodType]!;
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bloodType,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[600],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
