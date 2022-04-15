import 'package:flutter/material.dart';
import 'package:lab_7/card_view.dart';
import 'package:lab_7/core.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);

  var statusColor = Colors.white;
  var text = '';
  double bmiValue = bmi.calculate;

  checkBMI() {
    var value = bmiValue;
    if (value < 18.5) {
      statusColor = Colors.orangeAccent;
    } else if (value < 25) {
      statusColor = Colors.green;
    } else if (value < 29.9) {
      statusColor = Colors.orange;
    } else {
      statusColor = Colors.red;
    }
    return statusColor;
  }

  bmiText() {
    var value = bmiValue;
    if (value < 18.5) {
      text = 'UnderWeight';
    } else if (value < 25) {
      text = 'Normal';
    } else if (value < 29.9) {
      text = 'OverWeight';
    } else {
      text = 'Obese';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    bmiText();
    checkBMI();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Your Result',
                      style: AppStyles.textStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomCard(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${bmiText()}',
                          style: AppStyles.textStyle(
                            fontSize: 16,
                            color: statusColor,
                          ),
                        ),
                        Text(
                          '${bmiValue.toStringAsFixed(2)}',
                          style: AppStyles.textStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'You are ${text}!!!',
                          style: AppStyles.textStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.101,
                      color: Colors.pink,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'RE-CALCULATE',
                          style: AppStyles.textStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
