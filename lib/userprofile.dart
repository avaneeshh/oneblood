import 'package:flutter/material.dart';

void main() {
  runApp(AdminProfile());
}

class AdminProfile extends StatelessWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare Admin Profile',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffed1c24),
                Color(0xffea2528),
                Color(0xfff0472c),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48),
                Center(
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 8,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/profile_picture.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    'Admin Profile',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 48),
                buildProfileInfo('Hospital Name', 'XYZ Hospital'),
                buildProfileInfo('Scheduled Appointments', '2 upcoming appointments'),
                buildProfileInfo('Inventory Management', '43 items in stock'),
                buildProfileInfo('Patients & Patient Management', '5 patients in the system'),
                buildProfileInfo('Communication', '2 new messages'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileInfo(String title, String content) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}