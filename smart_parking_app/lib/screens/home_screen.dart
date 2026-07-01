import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String status = "LOADING";
  int distance = 0;

  Future fetchData() async {
    try {
      final data = await ApiService.getData();

      setState(() {
        status = data['slots'][0]['status'];
        distance = data['slots'][0]['distance'] ?? 0;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      while (true) {
        await fetchData();
        await Future.delayed(Duration(seconds: 2));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool occupied = status == "OCCUPIED";

    return Scaffold(
      backgroundColor: occupied ? Colors.red : Colors.green,
      appBar: AppBar(
        title: Text("SMART PARKING"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 250,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                Icons.local_parking,
                size: 80,
                color: occupied ? Colors.red : Colors.green,
              ),

              SizedBox(height: 20),

              Text(
                "Slot P1",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(
                status,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: occupied ? Colors.red : Colors.green,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Distance: $distance cm",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}