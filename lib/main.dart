import 'package:edukag/screens/get_started_view.dart';
import 'package:edukag/screens/home_view.dart';
import 'package:edukag/screens/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Edukag",
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: const Color.fromRGBO(255, 145, 77, 1),
          fontFamily: "Nunito"),
      initialRoute: '/splash',
      routes: {
        '/': (context) => SplashScreen(),
        '/home-screen': (context) => HomeScreen(),
        '/get-started': (context) => GetStarted(),
        '/splash': (context) => SplashScreen(),
      },
      // home: SplashScreen(),
    );
  }
}
