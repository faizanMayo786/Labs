import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

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
        (states) => Color.fromARGB(255, 240, 241, 241),
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
              ((context, index) => SizedBox(
                    width: 200,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.loose(
                          Size(MediaQuery.of(context).size.width, 350)),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          const borderSide =
                              BorderSide(width: 2, color: Colors.white54);
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
                                        height: 250,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            locations[index]['image'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 25,
                                        top: 25,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                top: borderSide,
                                                left: borderSide,
                                                right: borderSide,
                                                bottom: borderSide,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 10, sigmaY: 10),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.2)),
                                                child: Center(
                                                  child: Text(
                                                    locations[index]['rating']
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white,
                                                      letterSpacing: 2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Stack(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  locations[index]['title'],
                                                  style: const TextStyle(
                                                    fontSize: 24,
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
                                                      locations[index]['stay'],
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFF838E97),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                icon: const Icon(
                                                    Icons.more_vert_sharp),
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
                        },
                        itemCount: locations.length,
                        scale: 0.8,
                        itemHeight: 600,
                        viewportFraction: 0.7,
                      ),
                    ),
                  )),
              childCount: 1,
            ),
          )
        ],
      ),
      floatingActionButton: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 75,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  CustomNaviagtionIcons(icon: Icons.home),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomNaviagtionIcons(icon: Icons.explore_outlined),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomNaviagtionIcons(icon: Icons.star_border),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomNaviagtionIcons(icon: Icons.person),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class CustomNaviagtionIcons extends StatelessWidget {
  const CustomNaviagtionIcons({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final icon;

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

Color color = const Color(0xFF23A892);
