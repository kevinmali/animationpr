import 'package:animationpr/Views/Screens/Planet.dart';
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
                              PlanetWidget("Mars", "Asset/Images/img_mars.png",
                                  "mars description"),
                              PlanetWidget(
                                  "Earth",
                                  "Asset/Images/img_earth.png",
                                  "The third planet from the sun and the only astronomical thing that...."),
                              PlanetWidget(
                                  "Venus",
                                  "Asset/Images/img_venus.png",
                                  "venus description"),
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
