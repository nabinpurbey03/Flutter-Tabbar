import 'package:flutter/material.dart';

class DaysTabBar extends StatelessWidget {
  const DaysTabBar({Key? key, required this.days, required this.length})
      : super(key: key);

  final List<String> days;
  final int length;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        height: 75,
        width: 150,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(days[index],
                style: const TextStyle(
                    fontSize: 36, fontWeight: FontWeight.bold))),
      ),
      itemCount: length,
    );
  }
}
