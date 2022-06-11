import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';

class TimeSinceLastUpdate extends StatelessWidget {
  final int timeStamp;

  const TimeSinceLastUpdate({
    Key? key,
    required this.timeStamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentTimeStampSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    int delta = currentTimeStampSeconds - timeStamp;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          S.current.LastUpdate,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          _convert(delta),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  String _convert(int timeStamp) {
    var secondsInMinute = 60;
    var secondsInHour = 3600;
    var secondsInDay = 86400;

    int days = timeStamp ~/ secondsInDay;

    var hoursRemain = timeStamp - days * secondsInDay;

    int hours = hoursRemain ~/ secondsInHour;

    var minutesRemain = hoursRemain - hours * secondsInHour;

    int minutes = minutesRemain ~/ secondsInMinute;

    if (days > 0) {
      return '$days ${S.current.Days} $hours ${S.current.Hours} $minutes ${S.current.Minutes}';
    }
    if (hours > 0) {
      return '$hours ${S.current.Hours} $minutes ${S.current.Minutes}';
    } else {
      return '$minutes ${S.current.Minutes}';
    }
  }
}