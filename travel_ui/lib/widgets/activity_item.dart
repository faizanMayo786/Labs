import 'package:flutter/material.dart';

class ActicityItem extends StatelessWidget {
  const ActicityItem({
    Key? key,
    required this.e,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final e;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          SizedBox(
            width: 300,
            height: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                e['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 62,
            child: SizedBox(
              height: 50,
              width: 180,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => e['color'],
                  ),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      e['title'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      e['popularity'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
