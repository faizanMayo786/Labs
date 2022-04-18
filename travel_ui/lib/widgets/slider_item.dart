import 'package:flutter/material.dart';
import 'package:travel_ui/dummy_data.dart';

import '../core/constants.dart';
import 'blured_box.dart';

class CardItem extends StatelessWidget {
   CardItem({required this.item, Key? key}) : super(key: key);
  var item;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 70,
                  spreadRadius: 2,
                  offset: const Offset(
                    15.0,
                    15,
                  ),
                )
              ],
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Hero(
                    tag: '/main',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        item['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 25,
                    top: 25,
                    child: BlurredBox(
                      child: Text(
                        item['rating'].toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.bed,
                                size: 20,
                                color: color,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                item['stay'],
                                style: const TextStyle(
                                  color: Color(0xFF838E97),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          splashRadius: 15,
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.more_vert_sharp),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
