import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 178, 35, 35),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Heartbeat Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController motionController;
  double size = 100;

  @override
  void initState() {
    super.initState();

    motionController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.5,
      upperBound: 1.0,
    )..repeat(reverse: true); // Creates a pulsing effect

    motionController.addListener(() {
      setState(() {
        size = motionController.value * 200; // Scale animation size
      });
    });
  }

  @override
  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('lib/assets/images/heart.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
