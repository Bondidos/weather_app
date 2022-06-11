import 'package:flutter/material.dart';

class DividerWithPadding extends StatelessWidget {
  const DividerWithPadding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10.0,right: 10),
      child: Divider(thickness: 2),
    );
  }
}