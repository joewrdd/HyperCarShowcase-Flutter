import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_car_showcase/models/manufacturer.dart';

class ManufacturerDetailsScreen extends StatelessWidget {
  final Manufacturer manufacturer;
  const ManufacturerDetailsScreen({super.key, required this.manufacturer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manufacturer Detail'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: manufacturer.name,
                  child: Image.asset(
                    'assets/images/${manufacturer.image}',
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      manufacturer.name,
                      style: GoogleFonts.smoochSans(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      manufacturer.country,
                      style: GoogleFonts.smoochSans(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontSize: 28,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Founded in ${manufacturer.foundedYear}',
                      style: GoogleFonts.smoochSans(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          fontSize: 20,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Services: ',
                            style: GoogleFonts.smoochSans(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: manufacturer.services,
                            style: GoogleFonts.smoochSans(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              fontWeight: FontWeight.normal,
                              fontSize: 21,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/${manufacturer.carMaImage}',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
