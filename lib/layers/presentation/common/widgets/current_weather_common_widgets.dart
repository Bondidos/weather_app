import 'package:flutter/material.dart';

class MaxAndMinTemperature extends StatelessWidget {
  final double tempMax;
  final double tempMin;

  const MaxAndMinTemperature({
    Key? key,
    required this.tempMax,
    required this.tempMin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        "${tempMax.toStringAsFixed(0)}\u00B0/${tempMin.toStringAsFixed(0)}\u00B0",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
