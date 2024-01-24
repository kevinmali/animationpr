import 'dart:developer';
import 'dart:math';

import 'package:animationpr/Model/detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Provider/themprovider.dart';

class Detils_Page extends StatefulWidget {
  const Detils_Page({super.key});

  @override
  State<Detils_Page> createState() => _Detils_PageState();
}

class _Detils_PageState extends State<Detils_Page>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Details jdata = ModalRoute.of(context)!.settings.arguments as Details;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 0.5,
          width: MediaQuery.of(context).size.width / 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  (Provider.of<themeprovider>(context, listen: true)
                              .theme
                              .isdark ==
                          true)
                      ? 'Asset/image/hasjhs.jpg'
                      : 'Asset/image/detils.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Planets",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<themeprovider>(context, listen: false)
                        .changetheme();
                  },
                  icon: Icon(
                    (Provider.of<themeprovider>(context, listen: true)
                                .theme
                                .isdark ==
                            false)
                        ? Icons.sunny
                        : Icons.brightness_4,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  jdata.Detail,
                  style: GoogleFonts.akshar(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: controller.value * 2 * pi,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          jdata.Images,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            Text(
              jdata.Name,
              style: GoogleFonts.akshar(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ],
        ),
      ],
    ));
  }
}
