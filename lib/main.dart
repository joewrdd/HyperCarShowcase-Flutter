import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hyper_car_showcase/firebase_options.dart';
import 'package:hyper_car_showcase/screens/mains/auth.dart';
import 'package:hyper_car_showcase/screens/mains/splash.dart';
import 'package:hyper_car_showcase/screens/mains/tabs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wrdd HyperCar Showcase Club!',
      theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
      )),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (snapshot.hasData) {
              return const TabsScreen();
            } else {
              return const AuthScreen();
            }
          }),
    );
  }
}
