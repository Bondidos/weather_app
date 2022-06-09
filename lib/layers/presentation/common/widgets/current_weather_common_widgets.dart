import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        "$tempMax\u00B0/$tempMin\u00B0",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

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

class Description extends StatelessWidget {
  final String description;
  const Description({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        description,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class CurrentDate extends StatelessWidget {
  const CurrentDate({
    Key? key,
    required this.timeStamp,
  }) : super(key: key);

  final int timeStamp;

  @override
  Widget build(BuildContext context) {
    // todo should to show am/pm at us locale
    var format = DateFormat.MMMEd('en_US'); //todo last updated ....
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var dateString = format.format(date);
    return Text(
      dateString,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}