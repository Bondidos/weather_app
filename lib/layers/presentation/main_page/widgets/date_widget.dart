import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/constants.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.timeStamp,
  }) : super(key: key);

  final int timeStamp;

  @override
  Widget build(BuildContext context) {
    final String defaultLocale = Platform.localeName;
    final DateFormat format;
    if(defaultLocale.contains(languageEnglish)){
      format = DateFormat.MMMEd(languageEnglish);
    } else{
      format = DateFormat.MMMEd(languageRussian);
    }
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var dateString = format.format(date);
    return Text(
      dateString,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}