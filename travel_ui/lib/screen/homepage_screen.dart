import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/screen/detail_screen.dart';

import '../core/constants.dart';
import '../dummy_data.dart';
import '../widgets/navigation_bar_buttons.dart';
import '../widgets/slider_item.dart';

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
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(counter: index),
                                    ),
                                  );
                                },
                                child: CardItem(item: locationsSlides[index]));
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
                                const Text(
                                  'Top Destinations',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    color: color1,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 500,
                              height: 200,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 100,
                                  childAspectRatio: 5 / 2,
                                  crossAxisCount: 2,
                                ),
                                itemCount: topLocations.length,
                                itemBuilder: (context, index) => Container(
                                  height: 100,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(
                                              minWidth: 90,
                                              minHeight: 300,
                                              maxWidth: 90,
                                              maxHeight: 300,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              child: Image.network(
                                                topLocations[index]['image'],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              topLocations[index]['title']
                                                  .toString(),
                                            ),
                                            Text(
                                              topLocations[index]['subtitle']
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CustomBottomNavigationBar(),
    );
  }
}
