import 'package:flutter/material.dart';

class CurrentTemperature extends StatelessWidget {
  final double temp;

  const CurrentTemperature({
    Key? key,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        "$temp\u00B0",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}