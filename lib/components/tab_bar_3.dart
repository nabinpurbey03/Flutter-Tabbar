import 'package:flutter/material.dart';

class MonthsTabBar extends StatelessWidget {
  const MonthsTabBar({Key? key, required this.length, required this.months})
      : super(key: key);

  final int length;
  final List<String> months;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) => Container(
              height: 75,
              width: 150,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: Text(months[index],
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold))),
            ));
  }
}
