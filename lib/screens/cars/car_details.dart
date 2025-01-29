import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_car_showcase/models/car.dart';
import 'package:hyper_car_showcase/providers/favorites_provider.dart';
import 'package:hyper_car_showcase/widgets/car_detail_item_trait.dart';

class CarDetailsScreen extends ConsumerWidget {
  final Car car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String carPrice = '\$${car.price}';
    final favoriteCars = ref.watch(favoriteCarsProvider);
    final isFavorite =
        favoriteCars.any((c) => c.model == car.model && c.brand == car.brand);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text('Car Details'),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteCarsProvider.notifier)
                  .toggleCarFavoriteStatus(car);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.white,
                  content: Text(
                    wasAdded
                        ? 'Added to Favorites!'
                        : 'Removed From Favorites!',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: car.brand,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/${car.image}',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      car.brand,
                      style: GoogleFonts.smoochSans(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          fontSize: 18,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      car.model,
                      style: GoogleFonts.smoochSans(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      carPrice,
                      style: GoogleFonts.smoochSans(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.yellow),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      CarDetailItemTrait(
                        icon: Icons.speed,
                        label: car.speed.toString(),
                        car: car,
                      ),
                      const SizedBox(width: 25),
                      CarDetailItemTrait(
                        icon: Icons.shutter_speed,
                        label: car.horsepower.toString(),
                        car: car,
                      ),
                      const SizedBox(width: 25),
                      CarDetailItemTrait(
                        icon: Icons.local_gas_station,
                        label: 'Petrol',
                        car: car,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      style: GoogleFonts.smoochSans(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    car.description,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
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
