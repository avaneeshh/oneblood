import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank Newsfeed',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
      ),
      home: NewsfeedPage(),
    );
  }
}

class NewsfeedPage extends StatefulWidget {
  @override
  _NewsfeedPageState createState() => _NewsfeedPageState();
}

class _NewsfeedPageState extends State<NewsfeedPage> {
  double _cardScale = 1.0;

  void _onCardHover(bool isHovering) {
    setState(() {
      _cardScale = isHovering ? 1.05 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Bank Newsfeed'),
        backgroundColor: Color(0xFF7a0a0a),
      ),
      body: ListView(
        children: [
          _buildCard(
            title: 'Blood Drive in Manipal',
            subtitle:
            'Join us for a blood drive in KMC Manipal tomorrow at 10am!',
            imageUrl:
            'https://www.iiitb.ac.in/includefiles/newsevents/blooddonationcamp1.jpg',
          ),
          _buildCard(
            title: 'Blood Shortage Alert',
            subtitle: 'We urgently need O-negative blood donors!',
            imageUrl:
            'https://npr.brightspotcdn.com/legacy/sites/wuwf/files/201509/screen_shot_2015-09-10_at_9.47.20_pm.png',
          ),
          _buildCard(
            title: 'New Blood Bank Location',
            subtitle: 'Our new blood bank location is now open in the west side!',
            imageUrl:
            'https://www.unitedmedicity.com/images/blood-bank.webp',
          ),
          _buildCard(
            title: 'Expert urges for stronger evidence base to improve blood transfusion outcomes',
            subtitle: 'ERICA WOOD, president of the International Society of Blood Transfusion (ISBT), Sunday said there was a need for a stronger evidence base for the clinical practice of blood transfusion.',
            imageUrl:
            'https://images.indianexpress.com/2022/06/blood-transfusion_1200_getty.jpg?w=640',
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onEnter: (event) => _onCardHover(true),
        onExit: (event) => _onCardHover(false),
        child: Transform.scale(
          scale: _cardScale,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 10,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF7a0a0a),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}