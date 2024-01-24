import 'dart:convert';
import 'dart:math';

import 'package:animationpr/Model/detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                        FutureBuilder(
                          future: rootBundle.loadString("lib/json/galxy.json"),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("${snapshot.error}"),
                              );
                            } else if (snapshot.hasData) {
                              String? JsonData = snapshot.data;
                              List myData = jsonDecode(JsonData!);
                              List<Details> data = myData
                                  .map((e) => Details.fromjson(data: e))
                                  .toList();

                              return CarouselSlider(
                                options: CarouselOptions(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  viewportFraction: 0.7,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 2),
                                  autoPlayAnimationDuration:
                                      const Duration(seconds: 2),
                                ),
                                items: [
                                  ...data
                                      .map(
                                        (e) => Column(
                                          children: [
                                            AnimatedBuilder(
                                              animation: controller,
                                              builder: (context, child) {
                                                return Transform.rotate(
                                                  angle:
                                                      controller.value * 2 * pi,
                                                  child: Container(
                                                    height: 300,
                                                    width: 300,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child:
                                                        Image.asset(e.Images),
                                                  ),
                                                );
                                              },
                                            ),
                                            Text(
                                              " ${e.Name}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, "Detils",
                                                    arguments: e);
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 100,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xff1E72BA),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: const Icon(
                                                  Icons.play_arrow,
                                                  size: 34,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ],
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
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
