import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyper_car_showcase/models/car.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnalyticsScreenState();
  }
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<Car> carData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCarData();
  }

  Future<void> fetchCarData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('cars').get();
      final cars = snapshot.docs.map((doc) {
        var car = Car.fromMap(doc.data());
        print('Car Price: ${car.price}');
        return car;
      }).toList();

      print('Fetched Cars: $cars');

      setState(() {
        carData = cars;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching car data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double minPrice = carData.isNotEmpty
        ? carData
            .map((car) => double.tryParse(car.price) ?? 0.0)
            .reduce((a, b) => a < b ? a : b)
        : 0.0;
    // ignore: unused_local_variable
    double maxPrice = carData.isNotEmpty
        ? carData
            .map((car) => double.tryParse(car.price) ?? 0.0)
            .reduce((a, b) => a > b ? a : b)
        : 1000000.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Price Analytics'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Card(
                        color: const Color(0xFF1E1E1E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: carData.length * 120.0,
                              child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                ),
                                primaryYAxis: NumericAxis(
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  majorGridLines:
                                      const MajorGridLines(width: 0.5),
                                  axisLine: const AxisLine(width: 0),
                                  minimum: 0, // Start from 0
                                  maximum: 5000000, // Maximum value
                                  interval: 250000, // Interval of 250k
                                ),
                                backgroundColor: const Color(0xFF1E1E1E),
                                series: <CartesianSeries>[
                                  LineSeries<Car, String>(
                                    dataSource: carData,
                                    xValueMapper: (Car car, _) {
                                      return car.model;
                                    },
                                    yValueMapper: (Car car, _) {
                                      String priceString = car.price
                                          .replaceAll(RegExp(r'[^\d.]'), '');
                                      return double.tryParse(priceString) ??
                                          0.0;
                                    },
                                    color: Colors.red,
                                    markerSettings: const MarkerSettings(
                                      isVisible: true,
                                      color: Colors.red,
                                    ),
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
