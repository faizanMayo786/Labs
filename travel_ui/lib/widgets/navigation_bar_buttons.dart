import 'package:flutter/material.dart';

import '../core/constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

int selected = 0;

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                CustomNaviagtionIcons(
                  id: 0,
                  icon: Icons.home_rounded,
                  size: selected == 0 ? 35.0 : 30.0,
                  function: () {
                    setState(() {
                      selected = 0;
                    });
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomNaviagtionIcons(
                  id: 1,
                  icon: Icons.explore_outlined,
                  size: selected == 1 ? 35.0 : 30.0,
                  function: () {
                    setState(() {
                      selected = 1;
                    });
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomNaviagtionIcons(
                  id: 2,
                  icon: Icons.star_border,
                  size: selected == 2 ? 35.0 : 30.0,
                  function: () {
                    setState(() {
                      selected = 2;
                    });
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomNaviagtionIcons(
                  id: 3,
                  icon: Icons.person,
                  size: selected == 3 ? 35.0 : 30.0,
                  function: () {
                    setState(() {
                      selected = 3;
                    });
                  },
                ),
                const SizedBox(
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

class CustomNaviagtionIcons extends StatefulWidget {
  const CustomNaviagtionIcons({
    Key? key,
    required this.id,
    required this.icon,
    required this.size,
    required this.function,
  }) : super(key: key);
  final int id;
  final dynamic icon;
  final double size;
  final Function function;
  @override
  State<CustomNaviagtionIcons> createState() => _CustomNaviagtionIconsState();
}

class _CustomNaviagtionIconsState extends State<CustomNaviagtionIcons> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      splashRadius: 30,
      iconSize: widget.size,
      onPressed: () {
        widget.function();
      },
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: widget.size == 35 ? Colors.white : Colors.white54,
          ),
          widget.size == 35
              ? const Icon(
                  Icons.fiber_manual_record,
                  size: 5,
                  color: Colors.white,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
