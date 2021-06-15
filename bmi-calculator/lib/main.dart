import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
          thumbColor: Color(0xFFEB1555),
          activeTrackColor: Colors.white,
          inactiveTrackColor: Color(0xFF8D8E98),
          overlayColor: Color(0x29EB1555),
        ),
        primaryColor: Color(0XFF0A0D22),
        scaffoldBackgroundColor: Color(0XFF0A0D22),
      ),
      home: InputPage(),
    );
  }
}
