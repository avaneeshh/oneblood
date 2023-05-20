import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homepage/bloodvisual.dart';
import 'package:homepage/donordetails.dart';
import 'package:homepage/inventory.dart';
import 'package:homepage/locatenearest.dart';
import 'package:homepage/login.dart';
import 'package:homepage/newsfeed.dart';
import 'package:homepage/notifications.dart';
import 'package:homepage/settingspage.dart';
import 'package:homepage/userprofile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Bank Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
        DrawerHeader(
        child: Text(
          'Blood Bank Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
      ListTile(
        leading: Icon(
          Icons.location_on,
          color: Colors.red,
        ),
        title: Text(
          'Locate Nearest Blood Bank',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebViewExample()),
          );
        },
      ),
      ListTile(
        leading: Icon(
          Icons.person,
          color: Colors.red,
        ),
        title: Text(
          'Monitor User Details',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PatientRecords()),
          );
        },
      ),
      ListTile(
        leading: Icon(
          Icons.inventory,
          color: Colors.red,
        ),
        title: Text(
          'Inventory',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InventoryPage()),
          );
        },
      ),
      ListTile(
        leading: Icon(
          Icons.article,
          color: Colors.red,
        ),
        title: Text(
          'Newsfeed',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsfeedPage()),
          );
        },
      ),
      ListTile(
      leading: Icon(
      Icons.analytics,
      color: Colors.red,
    ),
    title: Text(
    'Blood Stock Analytics',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    ),
    ),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute
      (builder: (context) => BloodUnitsCollected()),
    );
    },
      ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'User Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'View your profile',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminProfile()),
                    );
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'View your notifications',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BloodBankNotificationsPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Change your settings',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BloodBankSettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image1.jpg'),
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
