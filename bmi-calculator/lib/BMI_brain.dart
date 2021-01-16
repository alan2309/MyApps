import 'dart:math';

class BmiBrain {
  BmiBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18) {
      return "NORMAL";
    } else {
      return "UNDERWEIGTH";
    }
  }

  String getResultMessage() {
    if (_bmi >= 25) {
      return "Your BodyWeight is quite high. Start Exercising.";
    } else if (_bmi > 18) {
      return "Your BodyWeight is Normal. Maintain it.";
    } else {
      return "Your BodyWeight is quite low. Start Eating.";
    }
  }
}
