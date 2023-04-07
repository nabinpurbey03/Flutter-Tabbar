import 'package:flutter/material.dart';

class WeeksTabBar extends StatelessWidget {
  const WeeksTabBar({Key? key, required this.length, required this.weeks})
      : super(key: key);

  final int length;
  final List<int> weeks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: length-1,
        itemBuilder: (context, index) => Container(
              height: 75,
              width: 150,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: Text("Week ${weeks[index+1]}",
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold))),
            ));
  }
}
