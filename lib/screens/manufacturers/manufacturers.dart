import 'package:flutter/material.dart';
import 'package:hyper_car_showcase/models/manufacturer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyper_car_showcase/screens/manufacturers/manufacturer_details.dart';

class ManufacturersScreen extends StatelessWidget {
  const ManufacturersScreen({super.key});

  void selectManufacturer(BuildContext context, Manufacturer manufacturer) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ManufacturerDetailsScreen(
          manufacturer: manufacturer,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manufacturers'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('manufacturers')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No Manufacturers Found!'));
            }

            final manufacturers = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return Manufacturer.fromMap(data);
            }).toList();
            return ListView.builder(
                itemCount: manufacturers.length,
                itemBuilder: (ctx, index) {
                  final manufacturer = manufacturers[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(
                        left: 50, right: 50, top: 20, bottom: 20),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () {
                        selectManufacturer(context, manufacturer);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: manufacturer.name,
                            child: Image.asset(
                              'assets/images/${manufacturer.image}',
                              fit: BoxFit.contain,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Icon(
                            Icons.arrow_forward,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
