import 'package:flutter/material.dart';
import 'package:flutter_liturgical_calendar/flutter_liturgical_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Liturgical Calendar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Liturgical Calendar Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _liturgicalDate = 'Fetching...';

  @override
  void initState() {
    super.initState();
    _fetchLiturgicalDate();
  }

  void _fetchLiturgicalDate() {
    print('Fetching liturgical date...'); // Debug print
    var nowTime = DateTime.now();
    var days = LiturgicalCalendar().getDays([nowTime]);
    print('Fetched liturgical date: ${days[0]}'); // Debug print
    setState(() {
      _liturgicalDate = "${days[0]}"; // Get the name of the liturgical day
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Today\'s Liturgical Date:'),
            Text(
              _liturgicalDate,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
