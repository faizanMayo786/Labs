// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'core.dart';

class GenderCard extends StatelessWidget {
  GenderCard({Key? key, required this.isMale}) : super(key: key);
  bool isMale;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          // ignore: deprecated_member_use
          isMale ? FontAwesomeIcons.male : FontAwesomeIcons.female,
          size: AppStyles.iconSize,
          color: AppColors.iconColor,
        ),
        const SizedBox(height: 20),
        Text(
          isMale ? 'MALE' : 'FEMALE',
          style: AppStyles.textStyle(
            fontSize: 16,
            color: const Color(0xFFD0D0D5),
          ),
        )
      ],
    );
  }
}
