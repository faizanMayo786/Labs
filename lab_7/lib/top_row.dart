import 'package:flutter/material.dart';

import 'card_view.dart';
import 'core.dart';
import 'gender_card.dart';

class GenderRow extends StatefulWidget {
  const GenderRow({Key? key}) : super(key: key);

  @override
  State<GenderRow> createState() => _GenderRowState();
}

class _GenderRowState extends State<GenderRow> {
  static bool isMale = false;
  static bool isFemale = false;

  @override
  Widget build(BuildContext context) {
    Color fColor =
        isFemale ? const Color(0xFF323244) : AppColors.containerColor;
    Color mColor = isMale ? const Color(0xFF323244) : AppColors.containerColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              bmi.gender = 'Female';
              if (isMale) {
                isMale = false;
              }
              isFemale = !isFemale;
            });
          },
          child: CustomCard(
            color: fColor,
            child: GenderCard(isMale: false),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isFemale) {
                bmi.gender = 'Male';
                isFemale = false;
              }
              isMale = !isMale;
            });
          },
          child: CustomCard(
            color: mColor,
            child: GenderCard(isMale: true),
          ),
        ),
      ],
    );
  }
}
