import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconsContent extends StatelessWidget {
  final IconData icon;
  final String label;
  IconsContent({this.icon, this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelStyleText,
        ),
      ],
    );
  }
}
