import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splash_screen/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    
    // Iniciar o controller para o AnimatedIcon
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Faz a animação repetir
    
    // Timer para redirecionar para a HomePage após 3 segundos
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Garantir que o controller seja descartado corretamente
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(child: Image.asset('assets/images/car.png')),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'GoGo Trip',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: AnimatedIcon(
                  icon: AnimatedIcons.view_list,
                  progress: _controller,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
