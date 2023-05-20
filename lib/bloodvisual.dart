import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class BloodUnitsCollected extends StatefulWidget {
  @override
  _BloodUnitsCollectedState createState() => _BloodUnitsCollectedState();
}

class _BloodUnitsCollectedState extends State<BloodUnitsCollected> {
  List<Map<String, dynamic>> records = [];
  List<charts.Series<Map<String, dynamic>, String>> chartData = [];
  int totalUnitsCollected = 0;
  String stateWithHighestUnits = '';
  String stateWithLowestUnits = '';

  Future<void> fetchData() async {
    final String apiKey = "579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b";
    final String url =
        "https://api.data.gov.in/resource/20865906-571d-4b1a-a788-3086c30a4e23?api-key=$apiKey&format=json";

    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);

    setState(() {
      records = List<Map<String, dynamic>>.from(responseData["records"]);

      // Sort records based on blood units in descending order
      records.sort((a, b) => b['year_2022___january_to_june'].compareTo(a['year_2022___january_to_june']));

      // Take top 10 records
      final top10Records = records.take(10).toList();

      chartData = [
        charts.Series<Map<String, dynamic>, String>(
          id: 'BloodUnits',
          domainFn: (Map<String, dynamic> data, _) => data['_state_ut'],
          measureFn: (Map<String, dynamic> data, _) => data['year_2022___january_to_june'],
          data: top10Records,
          labelAccessorFn: (Map<String, dynamic> data, _) => "${data['_state_ut']}: ${data['year_2022___january_to_june']}",
        ),
      ];

      // Calculate additional statistics
      totalUnitsCollected = records.fold(0, (sum, record) => sum + (record['year_2022___january_to_june'] as int));
      stateWithHighestUnits = top10Records.first['_state_ut'];
      stateWithLowestUnits = top10Records.last['_state_ut'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Blood Units Collected"),
          backgroundColor: Colors.red,
        ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Total Units Collected: $totalUnitsCollected",
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
    "State with Highest Units: $stateWithHighestUnits",
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
    "State with Lowest Units: $stateWithLowestUnits",
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 20),
    Expanded(
    child: charts.BarChart(
    chartData,
    animate: true,
    barGroupingType: charts.BarGroupingType.grouped,
    vertical: false,
    domainAxis: charts.OrdinalAxisSpec(
      renderSpec: charts.SmallTickRendererSpec(
        labelRotation: 45,
        labelJustification: charts.TickLabelJustification.outside,
        labelStyle: charts.TextStyleSpec(
          fontSize: 12,
          color: charts.MaterialPalette.black,
        ),
      ),
    ),
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(50),
        topMarginSpec: charts.MarginSpec.fixedPixel(10),
        rightMarginSpec: charts.MarginSpec.fixedPixel(10),
        bottomMarginSpec: charts.MarginSpec.fixedPixel(10),
      ),
    ),
    ),
    ],
    ),
        ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BloodUnitsCollected(),
  ));
}

