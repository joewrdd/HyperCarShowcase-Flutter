import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_car_showcase/models/car.dart';

class CarDetailItemTrait extends StatelessWidget {
  final IconData icon;
  final String label;
  final Car car;
  const CarDetailItemTrait({
    super.key,
    required this.icon,
    required this.label,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    String traitTitle;

    // Determine the title based on the label
    if (label == car.speed.toString()) {
      traitTitle = 'Top Speed';
    } else if (label == car.horsepower.toString()) {
      traitTitle = 'Horsepower';
    } else if (label == 'Petrol') {
      traitTitle = 'Fuel Type';
    } else {
      traitTitle = 'Unknown';
    }

    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          traitTitle,
          style: GoogleFonts.smoochSans(
            color: Colors.white,
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.smoochSans(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
