import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/widgets/blured_box.dart';
import 'package:travel_ui/widgets/slider_item.dart';

import '../core/constants.dart';
import '../dummy_data.dart';
import '../widgets/navigation_bar_buttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.resolveWith(
        (states) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      elevation: MaterialStateProperty.resolveWith((states) => 0),
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => const Color.fromARGB(255, 240, 241, 241),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              leading: ElevatedButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              actions: [
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Icon(
                    Icons.search,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              ((context, index) => Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.loose(
                            Size(MediaQuery.of(context).size.width, 350)),
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return CardItem(item: locationsSlides[index]);
                          },
                          itemCount: locationsSlides.length,
                          scale: 0.8,
                          itemHeight: 600,
                          viewportFraction: 0.7,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Top Destinations',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    color: color,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 400,
                              height: 400,
                              child: GridView(
                                padding: const EdgeInsets.all(25),
                                children: topLocations.map(
                                  (e) {
                                    return Card(
                                      child: ListTile(
                                        dense: true,
                                        leading: Container(
                                          // hei
                                          child: Image.network(
                                            e['image'],
                                          ),
                                        ),
                                        title: Text(e['title'].toString()),
                                      ),
                                    );
                                  },
                                ).toList(),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 310,
                                  // childAspectRatio: 3 / 2,
                                  // crossAxisSpacing: 10,
                                  mainAxisSpacing: 50,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              childCount: 1,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomBottomNavigationBar(),
    );
  }
}
