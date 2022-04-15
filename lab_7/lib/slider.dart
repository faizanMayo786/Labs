// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'core.dart';

class HeightSlider extends StatefulWidget {
 

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  double _value = 130;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Height',
          style: AppStyles.textStyle(
            fontSize: 16,
            color: const Color(0xFFD0D0D5),
          ),
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '${_value.round()}',
                style: AppStyles.textStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: 'cm', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Slider(
          activeColor: AppColors.sliderColor,
          min: 0,
          max: 300,
          value: _value,
          onChanged: (value) {
            setState(() {
              bmi.height = value.toInt();
              _value = value;
            });
          },
        ),
      ],
    );
  }
}
