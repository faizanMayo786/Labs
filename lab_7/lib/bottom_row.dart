// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lab_7/card_view.dart';

import 'core.dart';

class BottomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButtonCards(
          title: 'Weight',
          value: bmi.weight,
        ),
        CustomButtonCards(
          title: 'Age',
          value: bmi.age,
        ),
      ],
    );
  }
}

class CustomButtonCards extends StatefulWidget {
  CustomButtonCards({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  String title;
  dynamic value;
  @override
  State<CustomButtonCards> createState() => _CustomButtonCardsState();
}

class _CustomButtonCardsState extends State<CustomButtonCards> {
  assign(String title) {
    if (title == 'Age') {
      bmi.age = widget.value;
    } else {
      bmi.weight = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: AppStyles.textStyle(
              fontSize: 16,
              color: const Color(0xFFD0D0D5),
            ),
          ),
          Text(
            widget.value.toString(),
            style: AppStyles.textStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.value++;
                    assign(widget.title);
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.buttonBackgorundColor,
                    ),
                    shape: MaterialStateProperty.resolveWith(
                      (states) => const CircleBorder(),
                    ),
                    elevation: MaterialStateProperty.all(5)),
                child: const Icon(
                  Icons.add,
                  size: 35,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (widget.value > 0) widget.value--;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.buttonBackgorundColor,
                    ),
                    shape: MaterialStateProperty.resolveWith(
                      (states) => const CircleBorder(),
                    ),
                    elevation: MaterialStateProperty.all(5)),
                child: const Icon(
                  Icons.remove,
                  size: 35,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
