import 'package:flutter/material.dart';
import 'bottom_row.dart';
import 'results_screen.dart';

import 'card_view.dart';
import 'core.dart';
import 'top_row.dart';
import 'slider.dart';

void main() {
  runApp(MyApp());
}

class BMIInputScreen extends StatelessWidget {
  BMIInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text(
            'BMI Calculator',
          ),
          centerTitle: true,
        ),
        body: Container(
          color: AppColors.backgroundColor,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const GenderRow(),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomCard(
                          width: 320,
                          child: HeightSlider(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BottomRow(),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.pink,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultScreen()));
                  },
                  child: Text(
                    'CALCULATE',
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
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMIInputScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
