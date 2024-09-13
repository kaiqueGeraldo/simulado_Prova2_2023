import 'package:flutter/material.dart';
import 'package:splash_screen/cadastro_page.dart';
import 'package:splash_screen/home_page.dart';
import 'package:splash_screen/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/cadastro': (context) => const CadastroPage(),
      },
    );
  }
}
