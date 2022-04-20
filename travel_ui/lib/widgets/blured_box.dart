// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBox extends StatelessWidget {
  BlurredBox({required this.child, Key? key}) : super(key: key);
  Widget child;
  final borderSide = const BorderSide(width: 2, color: Colors.white54);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: borderSide,
            left: borderSide,
            right: borderSide,
            bottom: borderSide,
          ),
          borderRadius: const BorderRadius.all( Radius.circular(10))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            child: Center(
              child: child
            ),
          ),
        ),
      ),
    );
  }
}
