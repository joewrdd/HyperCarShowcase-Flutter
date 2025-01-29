import 'package:flutter/material.dart';
import '../cars/cars.dart';
import '../quiz/quiz.dart';
import '../favorites/favorites.dart';
import '../manufacturers/manufacturers.dart';
import '../analytics.dart';
import '../settings/settings.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> homeScreenList = [
    {'title': 'Dashboard', 'icon': Icons.bar_chart},
    {'title': 'Car Quiz', 'icon': Icons.emoji_events},
    {'title': 'Favorites', 'icon': Icons.star},
    {'title': 'Manufacturers', 'icon': Icons.precision_manufacturing},
    {'title': 'Analytics', 'icon': Icons.analytics},
    {'title': 'Settings', 'icon': Icons.settings},
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                children: homeScreenList.map((item) {
                  return InkWell(
                    onTap: () {
                      switch (item['title']) {
                        case 'Dashboard':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CarsScreen(),
                            ),
                          );
                          break;
                        case 'Car Quiz':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const QuizScreen(),
                            ),
                          );
                          break;
                        case 'Favorites':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const FavoritesScreen(),
                            ),
                          );
                          break;
                        case 'Manufacturers':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ManufacturersScreen(),
                            ),
                          );
                          break;
                        case 'Analytics':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AnalyticsScreen(),
                            ),
                          );
                          break;
                        case 'Settings':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SettingsScreen(),
                            ),
                          );
                          break;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.shade800,
                            Colors.grey.shade900,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item['icon'],
                              size: 35,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              item['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(29.0),
              child: Image.asset(
                'assets/images/side370z2.png',
                height: 200,
                width: 325,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
