import 'dart:math';

import 'package:animationpr/Model/detail.dart';
import 'package:animationpr/Views/Screens/Planet.dart';
import 'package:animationpr/Views/list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff1E72BA), Color(0xff2c1f6e)])),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Image.asset(
                  "Asset/Images/bg_stars.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Space\nExplorer",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: false,
                                aspectRatio: 1.0,
                                enlargeCenterPage: true,
                                viewportFraction: 0.6),
                            items: [
                              ...pla
                                  .map((e) => Container(
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 100, bottom: 30),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0)),
                                                color: Colors.white,
                                                child: Container(
                                                  width: double.infinity,
                                                  height: size.height,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 80,
                                                        ),
                                                        Text(
                                                          e['Name'],
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 28,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          e['Detail'],
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                          textAlign:
                                                              TextAlign.start,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: TweenAnimationBuilder(
                                                tween: Tween<double>(
                                                  begin: 0,
                                                  end: 2 * pi,
                                                ),
                                                duration:
                                                    const Duration(seconds: 16),
                                                child: Hero(
                                                  tag: 'hii',
                                                  child: Image.asset(
                                                    e['Images'],
                                                    width: 180,
                                                  ),
                                                ),
                                                builder:
                                                    (context, value, widget) {
                                                  return Transform.rotate(
                                                    angle: value,
                                                    child: widget,
                                                  );
                                                },
                                              ),
                                              //   child:
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Card(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  child: Card(
                                                    color: Colors.yellow,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Details D1 = Details(
                                                            Name: e['Name'],
                                                            Detail: e['Detail'],
                                                            Images:
                                                                e['Images']);
                                                        Navigator.of(context)
                                                            .pushNamed('Detils',
                                                                arguments: D1);
                                                      },
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        child: Icon(
                                                          Icons.arrow_forward,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList()
                              // PlanetWidget("Mars", "Asset/Images/img_mars.png",
                              //     "mars description"),
                              // PlanetWidget(
                              //     "Earth",
                              //     "Asset/Images/img_earth.png",
                              //     "The third planet from the sun and the only astronomical thing that...."),
                              // PlanetWidget(
                              //     "Venus",
                              //     "Asset/Images/img_venus.png",
                              //     "venus description"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
