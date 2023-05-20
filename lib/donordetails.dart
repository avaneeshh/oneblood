import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Records',
      theme: ThemeData(
        primaryColor: Color(0xFF7a0a0a),
        hintColor: Colors.white,
        backgroundColor: Color(0xFF7a0a0a),
      ),
      home: PatientRecords(),
    );
  }
}

class PatientRecords extends StatefulWidget {
  @override
  _PatientRecordsState createState() => _PatientRecordsState();
}

class _PatientRecordsState extends State<PatientRecords> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  List<Patient> _patientList = [];

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _contactController = TextEditingController();
  String _bloodType = 'A+ve';

  void _addPatient(String name, int age, String bloodType, String contactDetails) {

    _database.child('patients').push().set({
      'name': name,
      'age': age,
      'bloodType': bloodType,
      'contactDetails': contactDetails,
    });

    setState(() {
      _patientList.add(Patient(name: name, age: age, bloodType: bloodType, contactDetails: contactDetails));
    });
    _nameController.clear();
    _ageController.clear();
    _contactController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Patient Records'),
          backgroundColor: Colors.red,
    ),
    body: Column(
    children: [
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Add Patient',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,

    ),
    ),
    SizedBox(height: 16.0),
    TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText:'Enter Name',
    labelText: 'Name',
    ),
    controller: _nameController,
    ),
    SizedBox(height: 12.0),
    TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
      hintText:'Enter Age',
      labelText: 'Age',
    ),
    keyboardType: TextInputType.number,
    controller: _ageController,
    ),
    SizedBox(height: 12.0),
    TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
      hintText:'Enter Contact Details',
      labelText: 'Contact Details',
    ),
    controller: _contactController,
    ),
      SizedBox(height: 12.0),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Blood Type',
            contentPadding: EdgeInsets.all(16.0),
          ),
          value: _bloodType,
          onChanged: (value) {
            setState(() {
              _bloodType = value.toString();
            });
          },
          items: [
            DropdownMenuItem(
              value: 'A+ve',
              child: Text('A+ve'),
            ),
            DropdownMenuItem(
              value: 'A-ve',
              child: Text('A-ve'),
            ),
            DropdownMenuItem(
              value: 'B+ve',
              child: Text('B+ve'),
            ),
            DropdownMenuItem(
              value: 'B-ve',
              child: Text('B-ve'),
            ),
            DropdownMenuItem(

              value: 'AB+ve',
              child: Text('AB+ve'),
            ),
            DropdownMenuItem(
              value: 'AB-ve',
              child: Text('AB-ve'),
            ),
            DropdownMenuItem(
              value: 'O+ve',
              child: Text('O+ve'),
            ),
            DropdownMenuItem(
              value: 'other',
              child: Text('Other'),
            ),
          ],
        ),
      ),
      SizedBox(height: 16.0),
      ElevatedButton(
        onPressed: () {
          String contactDetails = _contactController.text;
          String name = _nameController.text;
          int age = int.tryParse(_ageController.text) ?? 0;
          _addPatient(name, age, _bloodType, contactDetails);
        },
        child: Text(
          'Add',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          elevation: MaterialStateProperty.all<double>(4.0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    ],
    ),
    ),
      Divider(height: 16.0),
      Expanded(
        child: ListView.builder(
          itemCount: _patientList.length,
          itemBuilder: (BuildContext context, int index) {
            Patient patient = _patientList[index];
            return ListTile(
              leading: Text('${index + 1}.'),
              title: Text(patient.name),
              subtitle: Text('Age: ${patient.age}, Blood Type: ${patient.bloodType}, Contact: ${patient.contactDetails}'),
            );
          },
        ),
      ),
    ],
    ),
    );
  }
}

class Patient {
  final String name;
  final int age;
  final String bloodType;
  final String contactDetails;

  Patient({
    required this.name,
    required this.age,
    required this.bloodType,
    required this.contactDetails,
  });
}