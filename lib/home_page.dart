import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 50, color: Colors.black),
        title: const Text('GOGO Trip'),
      ),
      body: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'Salvador',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Image.asset(
              'assets/images/mapa.png',
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                child: Text(
                  'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem loremlorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem loremlorem lorem ',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
