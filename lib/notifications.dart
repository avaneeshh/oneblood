import 'package:flutter/material.dart';

void main() => runApp(BloodBankApp());

class BloodBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank App',
      debugShowCheckedModeBanner: false,

      home: BloodBankNotificationsPage(),
    );
  }
}

class BloodBankNotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          _buildNotificationCard(
            context,
            'Scarcity of blood',
            'We are currently experiencing a shortage of blood supply. Please donate if you are able to.',
            Icons.info_outline,
            Colors.red,
          ),
          _buildNotificationCard(
            context,
            'New blood donation event',
            'We are holding a blood donation event on May 5th. Register now to donate and save lives!',
            Icons.notifications_active,
            Colors.green,
          ),
          _buildNotificationCard(
            context,
            'Appointment reminder',
            'Your blood donation appointment is coming up on May 10th at 10am.',
            Icons.calendar_today,
            Colors.blue,
          ),
          _buildNotificationCard(
            context,
            'Blood donation completed',
            'Thank you for your recent blood donation. Your donation has helped save lives.',
            Icons.favorite,
            Colors.pink,
          ),
          _buildNotificationCard(
            context,
            'Blood type urgently needed',
            'We urgently need donors with blood type AB- to donate blood. Please help if you are able to.',
            Icons.warning,
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context,
      String title,
      String subtitle,
      IconData iconData,
      Color color,
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Icon(iconData, color: color),
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () {
            // navigate to corresponding page
          },
        ),
      ),
    );
  }
}