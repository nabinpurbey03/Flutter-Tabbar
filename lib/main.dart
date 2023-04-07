import 'package:flutter/material.dart';
import 'package:playground_test/components/tab_bar_2.dart';
import 'package:playground_test/components/tab_bar_3.dart';
import 'package:playground_test/splash_screen.dart';

import 'components/tab_bar_1.dart';

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
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List<int> weeks = List.generate(53, (index) => index);
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade300,
        appBar: AppBar(
          title: const Text("U I - T E S T"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.all(10.0),
              child: TabBar(
                controller: _controller,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.deepPurpleAccent,
                    border: Border.all(width: 2)),
                tabs: const [
                  Tab(
                      child: Text(
                    'Day',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
                  Tab(
                      child: Text(
                    'Week',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
                  Tab(
                      child: Text(
                    'Month',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(controller: _controller, children: [
                DaysTabBar(
                  days: days,
                  length: days.length,
                ),
                WeeksTabBar(length: weeks.length, weeks: weeks),
                MonthsTabBar(length: months.length, months: months)
              ]),
            )
          ],
        ));
  }
}
