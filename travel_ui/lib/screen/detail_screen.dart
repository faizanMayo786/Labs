import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/dummy_data.dart';

import '../core/constants.dart';
import '../widgets/activity_item.dart';
import '../widgets/blured_box.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.counter}) : super(key: key);
  final int counter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE7EBEF),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 250,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 250,
                                  child: Hero(
                                    tag: 'main',
                                    child: Image.network(
                                      locationsSlides[counter]['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 150,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black45,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 25,
                          bottom: 25,
                          child: BlurredBox(
                            child: Text(
                              locationsSlides[counter]['rating'].toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 25,
                          bottom: 75,
                          child: BlurredBox(
                            child: const Icon(
                              Icons.wallpaper_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 25,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: BlurredBox(
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          bottom: 60,
                          child: Text(
                            locationsSlides[counter]['title'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          bottom: 35,
                          child: Text(
                            locationsSlides[counter]['country'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            locationsSlides[counter]['description'].toString(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Top Activity',
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        top: 5,
                        bottom: 5,
                      ),
                      child: SizedBox(
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: activities
                              .map(
                                (e) => ActicityItem(e: e),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 400,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white,
                          ),
                          foregroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black,
                          ),
                          shape: MaterialStateProperty.resolveWith(
                            (states) => const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            builder: (context) => DraggableScrollableSheet(
                              initialChildSize: 0.7,
                              minChildSize: 0.5,
                              maxChildSize: 0.9,
                              builder: ((context, scrollController) =>
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(50),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: ListView(
                                      controller: scrollController,
                                      children: [
                                        const Icon(
                                          Icons.remove_rounded,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                        const Center(
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                            vertical: 4,
                                          ),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'From',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                'To',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 130,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      'ODS',
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Odessa',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                              CircleAvatar(
                                                backgroundColor: color1,
                                                radius: 22,
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: Colors.white,
                                                  child: FaIcon(
                                                    FontAwesomeIcons.plane,
                                                    color: color1,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              SizedBox(
                                                width: 130,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: const [
                                                    Text(
                                                      'GNR',
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'G. Ngurah Rai',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Sort by:  ',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Container(
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: const Color.fromARGB(
                                                      255, 240, 241, 241),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Container(
                                                    width: 125,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              240,
                                                              241,
                                                              241),
                                                    ),
                                                    child: DropdownButton(
                                                      isExpanded: true,
                                                      style: const TextStyle(
                                                          fontSize: 14),
                                                      items: const [
                                                        DropdownMenuItem<
                                                            String>(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              'Price',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          value: ('Price'),
                                                        ),
                                                        DropdownMenuItem<
                                                            String>(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              'Lowest Price',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          value: ('Lowest'),
                                                        ),
                                                        DropdownMenuItem<
                                                            String>(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              'Highest Price',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          value: ('Highest'),
                                                        ),
                                                      ],
                                                      iconSize: 25,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        size: 25,
                                                      ),
                                                      underline: const Text(''),
                                                      value: 'Price',
                                                      onChanged: (_) {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                  color: Color.fromARGB(
                                                      255, 240, 241, 241),
                                                ),
                                                child: const Icon(
                                                  // ignore: deprecated_member_use
                                                  FontAwesomeIcons.slidersH,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        sheetCard(0),
                                        sheetCard(1),
                                        sheetCard(2),
                                        sheetCard(3),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 50,
                                            width: 180,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith(
                                                  (states) => color1,
                                                ),
                                                shape: MaterialStateProperty
                                                    .resolveWith(
                                                  (states) =>
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'BOOK',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.remove_rounded,
                                size: 40,
                                color: Colors.grey,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    '17 Feb 2021',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Odessa - Bali',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '\$987',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text(
                                    '02.55-19.55',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  sheetCard(int index) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                flight[index]['logo'].toString(),
                fit: BoxFit.contain,
                color: index == 0 ? Colors.red : null,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: index == 0
                        ? color1
                        : const Color.fromARGB(255, 240, 241, 241),
                  ),
                  height: 100,
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ODS   -  GNR',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                '11.00 - 16.00',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: index == 0
                                      ? Colors.white60
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: index == 0 ? Colors.white60 : Colors.black54,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Business\nClass',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color:
                                  index == 0 ? Colors.white60 : Colors.black54,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            '\$987',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: index == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
