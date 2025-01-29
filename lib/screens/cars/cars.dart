import 'package:flutter/material.dart';
import 'package:hyper_car_showcase/models/car.dart';
import 'package:hyper_car_showcase/screens/cars/car_details.dart';
import 'package:hyper_car_showcase/widgets/car_item_trait.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  void selectCar(BuildContext context, Car car) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CarDetailsScreen(
          car: car,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text('Cars Dashboard'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('cars').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No cars found'));
            }

            final cars = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return Car.fromMap(data);
            }).toList();

            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (ctx, index) {
                final car = cars[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.hardEdge,
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      selectCar(context, car);
                    },
                    child: Column(
                      children: [
                        Hero(
                          tag: car.brand,
                          child: Image.asset(
                            'assets/images/${car.image}',
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                car.model,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CarItemTrait(
                                    icon: Icons.directions_car_filled,
                                    label: car.brand,
                                  ),
                                  const SizedBox(width: 12),
                                  CarItemTrait(
                                    icon: Icons.attach_money,
                                    label: car.price,
                                  ),
                                  const SizedBox(width: 12),
                                  CarItemTrait(
                                    icon: Icons.speed,
                                    label: car.speed.toString(),
                                  ),
                                  const SizedBox(width: 12),
                                  CarItemTrait(
                                    icon: Icons.shutter_speed,
                                    label: car.horsepower.toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
