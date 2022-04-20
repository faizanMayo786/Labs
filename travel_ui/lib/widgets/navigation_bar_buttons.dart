import 'package:flutter/material.dart';

import '../core/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 15,
                ),
                CustomNaviagtionIcons(icon: Icons.home),
                SizedBox(
                  width: 15,
                ),
                CustomNaviagtionIcons(icon: Icons.explore_outlined),
                SizedBox(
                  width: 15,
                ),
                CustomNaviagtionIcons(icon: Icons.star_border),
                SizedBox(
                  width: 15,
                ),
                CustomNaviagtionIcons(icon: Icons.person),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNaviagtionIcons extends StatelessWidget {
  const CustomNaviagtionIcons({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25,
      iconSize: 35,
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
