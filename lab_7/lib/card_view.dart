// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'core.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    Key? key,
    required this.child,
    this.width = 150,
    this.height = 160,
    this.color = AppColors.containerColor,
  }) : super(key: key);
  Color color;
  Widget child;
  double width;
  double height;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((15)), color: widget.color),
      child: widget.child,
    );
  }
}
