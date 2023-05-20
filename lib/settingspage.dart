import 'package:flutter/material.dart';

void main() => runApp(BloodBankApp());

class BloodBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF8a0302),
      ),
      home: BloodBankSettingsPage(),
    );
  }
}

class BloodBankSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.person, color: Color(0xFF8a0302)),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to profile settings page
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.notifications, color: Color(0xFF8a0302)),
              title: Text('Notifications'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to notification settings page
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.location_on, color: Color(0xFF8a0302)),
              title: Text('Location'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to location settings page
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.security, color: Color(0xFF8a0302)),
              title: Text('Security'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to security settings page
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.help_outline, color: Color(0xFF8a0302)),
              title: Text('Help'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to help page
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.info_outline, color: Color(0xFF8a0302)),
              title: Text('About'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to about page
              },
            ),
          ),
        ],
      ),
    );
  }
}